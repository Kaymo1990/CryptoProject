class Dates
    def timeConversion
        Time.new.strftime("%d-%m-%Y")
    end
    
    def dateMap(days)
            oneDAY = 86400
            mappedDates = []
            dayCount = 0
    
            while dayCount < days 
                mappedDates << (Time.now - (oneDAY * dayCount)).strftime("%d-%m-%Y")
                dayCount+=1
            end
    
            return mappedDates
        end
end