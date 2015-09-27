  module Checkpoints
  # Update a checkpoint
  #
  # @param id [Integer] A checkpoint id
  # @param options [Hash] A customizable set of options.
  # @option options [String] :name Checkpoint name.
  # @option options [String] :summary Checkpoint summary.
  # @option options [String] :body Checkpoint body.
  # @option options [String] :assignment Checkpoint assignment.
  # @option options [Integer] :points Checkpoint point.
  # @option options [String] :body_and_assignment Checkpoint body and Assignment
  # @return [HTTParty::Response] The updated checkpoint
  # @example Update a checkpoint
  #   SpartacusClient.new.update_checkpoint(129, {name: 'Real Cool Checkpoint'})
  def update_checkpoint(id, options={})
    accepted_params = ['name', 'summary', 'body', 'assignment', 'points', 'body_and_assignment']
    checkpoint_params = options.select {|k, v| accepted_params.include?(k) }
    update_checkpoint_url = "#{@api_base_path}/checkpoints/#{id}"

    handle_timeouts do
      self.class.put(update_checkpoint_url,
                     headers: auth_header,
                     query: { checkpoint: checkpoint_params })
    end
  end
end