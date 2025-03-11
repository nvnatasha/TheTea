class TeaSerializer
    def self.format_teas(teas)
        {
            data: teas.map do |tea|
                {
                    id: tea.id.to_s,
                    type: 'tea',
                    attributes: {
                        name: tea.name,
                        description: tea.description,
                        brew_temp: tea.brew_temp,
                        brew_time: tea.brew_time
                    }
                }
            end
        }
    end

    def self.format_tea(tea)
        {
            data: {
                id: tea.id.to_s,
                type: 'tea',
                attributes: {
                    name: tea.name,
                    description: tea.description,
                    temp: tea.temp,
                    brew_time: tea.brew_time
                }
            }
        }
    end
end