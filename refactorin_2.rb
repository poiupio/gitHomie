def generate_name
  name=fullname
  return name unless organization_id
  organization = Organization.lookup(id: organization_id)
  return name += " (#{organization.name})" if organization
  name
end