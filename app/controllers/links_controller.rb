class LinksController < ApplicationController
  before_action :set_link, only: [:show]

=begin
  @apiVersion 1.0.0
  @api {get} /links Index - Fetch all Links
  @apiGroup Links Endpoint

  @apiExample {url} Url Example for Links
            http://example.com/links

  @apiSuccess {Object[]} links Array of Links Objects
  @apiSuccess {Integer}  links.id Link ID
  @apiSuccess {String}   links.url url of the link
  @apiSuccess {Boolean}  link.completed Has this url been fully parsed? true or false
  @apiSuccess {Object}   links._meta meta object on the link
  @apiSuccess {String}   links._meta.self url of the link
=end
  def index
    @links = Link.all

    render json: @links, include_contents: false
  end

=begin
  @apiVersion 1.0.0
  @api {get} /links/:id Index - Show a link

  @apiGroup Links Endpoint

  @apiError RecordNotFound {Object} The resource you tried to access was not found
  @apiErrorExample {json} Error-Response:
        HTTP/1.1 404 Not Found
        {
          "errors": {
            "message": "The resource you tried to access was not found"
          }
        }

  @apiExample {url} Url Example for Links
            http://example.com/links/1

  @apiParam {Integer} [id] id of the link

  @apiSuccess {Object}    link Link Object
  @apiSuccess {Integer}   link.id Link ID
  @apiSuccess {String}    link.url url of the link
  @apiSuccess {Boolean}   link.completed Has this url been fully parsed? true or false
  @apiSuccess {Object}    link._meta meta object on the link
  @apiSuccess {String}    link._meta.self url of the link
  @apiSuccess {Array}     link.contents Array of contents
  @apiSuccess {Integer}   link.contents.id Content ID
  @apiSuccess {String}    link.contents.tag tag of this content. Could be either of `h1`, `h2`, `h3` or `url`
  @apiSuccess {String}    link.contents.body the body of this content

=end
  def show
    render json: @link
  end

=begin
  @apiVersion 1.0.0
  @api {post} /links Index - Create a new link
  @apiGroup Links Endpoint

  @apiError RecordNotFound {Object} The resource could not be created
  @apiErrorExample {json} Error-Response:
          HTTP/1.1 422 Not Found
          {
            "errors": {
              "message": {
                    "url": [
                      "can't be blank",
                      "is invalid"
                    ]
              }
            }
          }

  @apiExample {url} Url Example for Links
            http://example.com/links

  @apiParam {Object}      link Link Object
  @apiParam {String}      link.url url of the link

  @apiSuccess {Object}    link Link Object
  @apiSuccess {Integer}   link.id Link ID
  @apiSuccess {String}    link.url url of the link
  @apiSuccess {Boolean}   link.completed Has this url been fully parsed? true or false
  @apiSuccess {Object}    link._meta meta object on the link
  @apiSuccess {String}    link._meta.self url of the link
=end
  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link, status: :created, location: @link, include_contents: false
    else
      render json: @link.errors.messages, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.fetch(:link, {}).permit(:url)
    end
end
