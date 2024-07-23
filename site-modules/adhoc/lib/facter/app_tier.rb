Facter.add(:app_tier) do
  setcode do
    certname = Facter.value('certname')
    certname
  end
end
