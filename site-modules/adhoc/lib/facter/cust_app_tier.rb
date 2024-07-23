Facter.add(:cust_app_tier) do
  setcode do
    hostname = 'something-01'
#    hostname = Facter.value('networking.hostname')
    case hostname
    when /^.*\D0.*/
      'production'
    when /^.*\D1.*/
      'stage'
    when /^.*\D2.*/
      'test'
    when /^.*\D3.*/
      'dev'
    when /^.*\D4.*/
      'sandbox'
    else
      nil
    end
  end
end
