Facter.add(:app_tier) do
  setcode do
    hostname = 'something-01'
#    hostname = Facter.value('networking.hostname')
    case hostname
    when /^.*\D2.*/
      'test'
    when /^.*\D1.*/
      'stage'
    when /^.*\D4.*/
      'sandbox'
    when /^.*\D0.*/
      'production'
    else
      nil
    end
  end
end
