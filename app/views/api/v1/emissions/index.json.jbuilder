if (!@message)
	json.System(@emission) do |emission|
		json.id emission.id
		json.city emission.city
		json.template emission.template
		json.send_restart emission.send_restart
		json.channel_tv emission.channel
		json.color emission.color
		json.sponsor emission.path_sponsor
		json.type_emission emission.type_emission
		if emission.type_emission == 'big_screen'
			json.width emission.width
			json.height emission.height
			json.kiosk_mode false
			@bgscreen = true
		else
			json.kiosk_mode true
			json.caller_fullscreen emission.caller_fullscreen
			@bgscreen = false
		end
	end

	if @bgscreen != true
		json.Callers(@emission) do |emission|
			if emission.type_emission == 'big_screen'

			else
				if emission.name_caller_1 != nil
					json.name_caller_1 emission.name_caller_1
					json.keycode_up_caller_1 emission.keycode_up_caller_1
					json.keycode_down_caller_1 emission.keycode_down_caller_1
				end
				if emission.name_caller_2 != nil
					json.name_caller_2 emission.name_caller_2
					json.keycode_up_caller_2 emission.keycode_up_caller_2
					json.keycode_down_caller_2 emission.keycode_down_caller_2
				end
				if emission.name_caller_3 != nil
					json.name_caller_3 emission.name_caller_3
					json.keycode_up_caller_3 emission.keycode_up_caller_3
					json.keycode_down_caller_3 emission.keycode_down_caller_3
				end
				if emission.name_caller_4 != nil
					json.name_caller_5 emission.name_caller_4
					json.keycode_up_caller_4 emission.keycode_up_caller_4
					json.keycode_down_caller_4 emission.keycode_down_caller_4
				end
				if emission.name_caller_5 != nil
					json.name_caller_5 emission.name_caller_5
					json.keycode_up_caller_5 emission.keycode_up_caller_5
					json.keycode_down_caller_5 emission.keycode_down_caller_5
				end
				if emission.name_caller_6 != nil
					json.name_caller_6 emission.name_caller_6
					json.keycode_up_caller_6 emission.keycode_up_caller_6
					json.keycode_down_caller_6 emission.keycode_down_caller_6
				end
			end
		end
	end
	json.Weather (@weather_now) do |weather|
		json.temperature weather.temperature
		json.humidity weather.humidity
		json.icon weather.icon
		json.wind weather.wind
		json.pressure weather.pressure
		json.description weather.description
	end

	json.Weather_Next_Days (@weather_next_days) do |weathernd|
		json.temperature_min weathernd.temperature_min
		json.temperature_max weathernd.temperature_max
		json.humidity weathernd.humidity
		json.icon weathernd.icon
		json.description weathernd.description
	end

	json.News (@news_source) do |new|
		json.title new.title
		json.description new.description
		json.newspaper new.newspaper
		json.image new.image_url
	end

	json.Horoscope (@horoscopes) do |horoscope|
		json.sign horoscope.sign
		json.description horoscope.description
	end

	json.Contents (@uploads) do |upload|
		json.path upload.path
		json.md5 upload.md5
		json.start_publish upload.start_publish
		json.end_publish upload.end_publish
		json.position upload.position
	end
else
	json.Error (@message)
end