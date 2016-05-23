class AddMembersToMatching < ActiveRecord::Migration
  def change
    add_column :matchings, :member1_summoner_name, :string
    add_column :matchings, :member1_role_primary, :integer
    add_column :matchings, :member1_role_secondary, :integer
    add_column :matchings, :member1_token, :string
    add_column :matchings, :member1_rank, :string

    add_column :matchings, :member2_summoner_name, :string
    add_column :matchings, :member2_role_primary, :integer
    add_column :matchings, :member2_role_secondary, :integer
    add_column :matchings, :member2_token, :string
    add_column :matchings, :member2_rank, :string

    add_column :matchings, :member3_summoner_name, :string
    add_column :matchings, :member3_role_primary, :integer
    add_column :matchings, :member3_role_secondary, :integer
    add_column :matchings, :member3_token, :string
    add_column :matchings, :member3_rank, :string

    add_column :matchings, :member4_summoner_name, :string
    add_column :matchings, :member4_role_primary, :integer
    add_column :matchings, :member4_role_secondary, :integer
    add_column :matchings, :member4_token, :string
    add_column :matchings, :member4_rank, :string

    add_column :matchings, :member5_summoner_name, :string
    add_column :matchings, :member5_role_primary, :integer
    add_column :matchings, :member5_role_secondary, :integer
    add_column :matchings, :member5_token, :string
    add_column :matchings, :member5_rank, :string
  end
end
