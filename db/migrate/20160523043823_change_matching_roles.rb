class ChangeMatchingRoles < ActiveRecord::Migration
  def change
    add_column :matchings, :member1_top, :boolean, default: false, null: false
    add_column :matchings, :member2_top, :boolean, default: false, null: false
    add_column :matchings, :member3_top, :boolean, default: false, null: false
    add_column :matchings, :member4_top, :boolean, default: false, null: false
    add_column :matchings, :member5_top, :boolean, default: false, null: false
    add_column :matchings, :member1_mid, :boolean, default: false, null: false
    add_column :matchings, :member2_mid, :boolean, default: false, null: false
    add_column :matchings, :member3_mid, :boolean, default: false, null: false
    add_column :matchings, :member4_mid, :boolean, default: false, null: false
    add_column :matchings, :member5_mid, :boolean, default: false, null: false
    add_column :matchings, :member1_bot, :boolean, default: false, null: false
    add_column :matchings, :member2_bot, :boolean, default: false, null: false
    add_column :matchings, :member3_bot, :boolean, default: false, null: false
    add_column :matchings, :member4_bot, :boolean, default: false, null: false
    add_column :matchings, :member5_bot, :boolean, default: false, null: false
    add_column :matchings, :member1_sup, :boolean, default: false, null: false
    add_column :matchings, :member2_sup, :boolean, default: false, null: false
    add_column :matchings, :member3_sup, :boolean, default: false, null: false
    add_column :matchings, :member4_sup, :boolean, default: false, null: false
    add_column :matchings, :member5_sup, :boolean, default: false, null: false
    add_column :matchings, :member1_jg, :boolean, default: false, null: false
    add_column :matchings, :member2_jg, :boolean, default: false, null: false
    add_column :matchings, :member3_jg, :boolean, default: false, null: false
    add_column :matchings, :member4_jg, :boolean, default: false, null: false
    add_column :matchings, :member5_jg, :boolean, default: false, null: false

    remove_column :matchings, :member1_role_primary
    remove_column :matchings, :member1_role_secondary
    remove_column :matchings, :member2_role_primary
    remove_column :matchings, :member2_role_secondary
    remove_column :matchings, :member3_role_primary
    remove_column :matchings, :member3_role_secondary
    remove_column :matchings, :member4_role_primary
    remove_column :matchings, :member4_role_secondary
    remove_column :matchings, :member5_role_primary
    remove_column :matchings, :member5_role_secondary
    remove_column :matchings, :top_point
    remove_column :matchings, :mid_point
    remove_column :matchings, :bot_point
    remove_column :matchings, :sup_point
    remove_column :matchings, :jg_point
  end
end
