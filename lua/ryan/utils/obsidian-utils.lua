local M = {}
function M.date_title()
	-- Get the current date
	local current_date = os.date("*t")

	-- Define tables for day names and month names
	local days = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
	local months = {
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December",
	}

	-- Format the date string
	local formatted_date = string.format(
		"%s - %02d %s, %d",
		days[current_date.wday],
		current_date.day,
		months[current_date.month],
		current_date.year
	)

	return formatted_date
end

return M
