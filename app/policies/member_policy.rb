class MemberPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.role.permissions.where(action: "index", resource: "Member").exists?
        scope.all
      else
        scope.none
      end
    end
  end

  def index?
    allowed_to?(:index)
  end

  def show?
    allowed_to?(:read)
  end

  def update?
    allowed_to?(:edit)
  end

  def create?
    allowed_to?(:create)
  end

  def destroy?
    allowed_to?(:destroy)
  end

  private

  def allowed_to?(action)
    # Memeriksa apakah user memiliki izin untuk action tertentu pada Employee
    user_permissions.include?([action.to_s, "Member"])
  end

  def user_permissions
    # Mengambil array [action, resources] dari permissions yang terkait dengan role user
    user.role.permissions.pluck(:action, :resource)
  end
end
