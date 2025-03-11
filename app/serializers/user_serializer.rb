class UserSerializer
    def self.format_users(users)
        {
            data: users.map do |user|
                {
                    id: user.id.to_s,
                    type: 'user',
                    attributes: {
                        first_name: user.first_name,
                        last_name: user.last_name,
                        username: user.username
                    }
                }
            end
        }
    end

    def self.format_user(user)
        {
            data:{
                id: user.id.to_s,
                type: 'user',
                attributes: {
                    first_name: user.first_name,
                    last_name: user.last_name,
                    username: user.username
                }
            }
        }
    end
end