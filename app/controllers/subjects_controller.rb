class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[show edit update destroy]

  # GET /subjects/1 or /subjects/1.json
  def show; end

  # GET /subjects/new
  def new
    @groups = Group.all
    @group = Group.find(params[:group_id])

    if @group.author == current_user
      @subject = Subject.new
    else
      flash[:alert] = 'You can only create expenses from your categories'
      redirect_to groups_path
    end
  end

  # GET /subjects/1/edit
  def edit; end

  # POST /subjects or /subjects.json
  def create
    @groups = Group.where(id: groups_params[:groups])
    @group = Group.find(params[:group_id])
    @subject = Subject.new(subject_params)
    @subject.author = current_user
    @subject.groups << @groups
    if @subject.save
      flash[:notice] = 'Subject was created successfully'
      redirect_to group_path(@group)
    else
      redirect_to new_group_subject_path(@group)
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subject_url(@subject), notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:name, :amount)
  end

  def groups_params
    params.require(:subject).permit(groups: [])
  end
end
