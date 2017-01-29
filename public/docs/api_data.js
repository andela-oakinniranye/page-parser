define({ "api": [  {    "version": "1.0.0",    "type": "get",    "url": "/links",    "title": "Fetch all Links",    "group": "Links_Endpoint",    "examples": [      {        "title": "Url Example for Links",        "content": "http://example.com/links",        "type": "url"      }    ],    "success": {      "fields": {        "Success 200": [          {            "group": "Success 200",            "type": "Object[]",            "optional": false,            "field": "links",            "description": "<p>Array of Links Objects</p>"          },          {            "group": "Success 200",            "type": "Integer",            "optional": false,            "field": "links.id",            "description": "<p>Link ID</p>"          },          {            "group": "Success 200",            "type": "String",            "optional": false,            "field": "links.url",            "description": "<p>url of the link</p>"          },          {            "group": "Success 200",            "type": "Boolean",            "optional": false,            "field": "link.completed",            "description": "<p>Has this url been fully parsed? true or false</p>"          },          {            "group": "Success 200",            "type": "Object",            "optional": false,            "field": "links._meta",            "description": "<p>meta object on the link</p>"          },          {            "group": "Success 200",            "type": "String",            "optional": false,            "field": "links._meta.self",            "description": "<p>url of the link</p>"          }        ]      }    },    "filename": "app/controllers/links_controller.rb",    "groupTitle": "Links_Endpoint",    "name": "GetLinks"  },  {    "version": "1.0.0",    "type": "get",    "url": "/links/:id",    "title": "Show a link",    "group": "Links_Endpoint",    "error": {      "fields": {        "Error 4xx": [          {            "group": "Error 4xx",            "optional": false,            "field": "RecordNotFound",            "description": "<p>{Object} The resource you tried to access was not found</p>"          }        ]      },      "examples": [        {          "title": "Error-Response:",          "content": "HTTP/1.1 404 Not Found\n{\n  \"errors\": {\n    \"message\": \"The resource you tried to access was not found\"\n  }\n}",          "type": "json"        }      ]    },    "examples": [      {        "title": "Url Example for Links",        "content": "http://example.com/links/1",        "type": "url"      }    ],    "parameter": {      "fields": {        "Parameter": [          {            "group": "Parameter",            "type": "Integer",            "optional": true,            "field": "id",            "description": "<p>id of the link</p>"          }        ]      }    },    "success": {      "fields": {        "Success 200": [          {            "group": "Success 200",            "type": "Object",            "optional": false,            "field": "link",            "description": "<p>Link Object</p>"          },          {            "group": "Success 200",            "type": "Integer",            "optional": false,            "field": "link.id",            "description": "<p>Link ID</p>"          },          {            "group": "Success 200",            "type": "String",            "optional": false,            "field": "link.url",            "description": "<p>url of the link</p>"          },          {            "group": "Success 200",            "type": "Boolean",            "optional": false,            "field": "link.completed",            "description": "<p>Has this url been fully parsed? true or false</p>"          },          {            "group": "Success 200",            "type": "Object",            "optional": false,            "field": "link._meta",            "description": "<p>meta object on the link</p>"          },          {            "group": "Success 200",            "type": "String",            "optional": false,            "field": "link._meta.self",            "description": "<p>url of the link</p>"          },          {            "group": "Success 200",            "type": "Array",            "optional": false,            "field": "link.contents",            "description": "<p>Array of contents</p>"          },          {            "group": "Success 200",            "type": "Integer",            "optional": false,            "field": "link.contents.id",            "description": "<p>Content ID</p>"          },          {            "group": "Success 200",            "type": "String",            "optional": false,            "field": "link.contents.tag",            "description": "<p>tag of this content. Could be either of <code>h1</code>, <code>h2</code>, <code>h3</code> or <code>url</code></p>"          },          {            "group": "Success 200",            "type": "String",            "optional": false,            "field": "link.contents.body",            "description": "<p>the body of this content</p>"          }        ]      }    },    "filename": "app/controllers/links_controller.rb",    "groupTitle": "Links_Endpoint",    "name": "GetLinksId"  },  {    "version": "1.0.0",    "type": "post",    "url": "/links",    "title": "Create a new link",    "group": "Links_Endpoint",    "error": {      "fields": {        "Error 4xx": [          {            "group": "Error 4xx",            "optional": false,            "field": "RecordNotFound",            "description": "<p>{Object} The resource could not be created</p>"          }        ]      },      "examples": [        {          "title": "Error-Response:",          "content": "HTTP/1.1 422 Not Found\n{\n  \"errors\": {\n    \"message\": {\n          \"url\": [\n            \"can't be blank\",\n            \"is invalid\"\n          ]\n    }\n  }\n}",          "type": "json"        }      ]    },    "examples": [      {        "title": "Url Example for Links",        "content": "http://example.com/links",        "type": "url"      }    ],    "parameter": {      "fields": {        "Parameter": [          {            "group": "Parameter",            "type": "Object",            "optional": false,            "field": "link",            "description": "<p>Link Object</p>"          },          {            "group": "Parameter",            "type": "String",            "optional": false,            "field": "link.url",            "description": "<p>url of the link</p>"          }        ]      }    },    "success": {      "fields": {        "Success 200": [          {            "group": "Success 200",            "type": "Object",            "optional": false,            "field": "link",            "description": "<p>Link Object</p>"          },          {            "group": "Success 200",            "type": "Integer",            "optional": false,            "field": "link.id",            "description": "<p>Link ID</p>"          },          {            "group": "Success 200",            "type": "String",            "optional": false,            "field": "link.url",            "description": "<p>url of the link</p>"          },          {            "group": "Success 200",            "type": "Boolean",            "optional": false,            "field": "link.completed",            "description": "<p>Has this url been fully parsed? true or false</p>"          },          {            "group": "Success 200",            "type": "Object",            "optional": false,            "field": "link._meta",            "description": "<p>meta object on the link</p>"          },          {            "group": "Success 200",            "type": "String",            "optional": false,            "field": "link._meta.self",            "description": "<p>url of the link</p>"          }        ]      }    },    "filename": "app/controllers/links_controller.rb",    "groupTitle": "Links_Endpoint",    "name": "PostLinks"  }] });
