# frozen_string_literal: true

RSpec.describe "Post Routes", type: :routing do
  it "routes /posts to the posts controller index route" do
    expect(get("/posts")).to route_to("posts#index")
  end

  it "routes /posts/new to the posts controller new route" do
    expect(get("/posts/new")).to route_to("posts#new")
  end

  it "routes /posts to the posts controller create route" do
    expect(post("/posts")).to route_to("posts#create")
  end

  it "routes /posts/:id to the posts controller show route" do
    expect(get("/posts/1")).to route_to("posts#show", id: "1")
  end

  it "routes /posts/:id/edit to the posts controller edit route" do
    expect(get("/posts/1/edit")).to route_to("posts#edit", id: "1")
  end

  it "routes /posts/:id to the posts controller update route" do
    expect(put("/posts/1")).to route_to("posts#update", id: "1")
  end

  it "routes /posts/:id to the posts controller destroy route" do
    expect(delete("/posts/1")).to route_to("posts#destroy", id: "1")
  end
end