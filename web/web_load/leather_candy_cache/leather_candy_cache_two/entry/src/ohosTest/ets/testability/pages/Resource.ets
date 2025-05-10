import web_webview from '@ohos.web.webview';

export interface ResourceConfig {
  urlList: Array<string>,
  type: web_webview.OfflineResourceType,
  responseHeaders: Array<Header>,
  localPath: string, // 本地资源存放在rawfile目录下的路径
}

export const resourceConfigs: Array<ResourceConfig> = [
  {
    localPath: "icon.png",
    urlList: [
      "https://www.example.com/",
      "https://www.example.com/path1/icon.png",
      "https://www.example.com/path2/icon.png",
    ],
    type: web_webview.OfflineResourceType.IMAGE,
    responseHeaders: [
      { headerKey: "Cache-Control", headerValue: "max-age=1000" },
      { headerKey: "Content-Type", headerValue: "image/png" },
    ]
  },
  {
    localPath: "test.js",
    urlList: [ // 仅提供一个url，这个url既作为资源的源，也作为资源的网络请求地址
      "https://www.example.com/test.js",
    ],
    type: web_webview.OfflineResourceType.CLASSIC_JS,
    responseHeaders: [
    // 以<script crossorigin="anoymous" />方式使用，提供额外的响应头
      { headerKey: "Cross-Origin", headerValue:"anonymous" }
    ]
  },
  {
    localPath: "test.css",
    urlList: [ // 仅提供一个url，这个url既作为资源的源，也作为资源的网络请求地址
      "https://www.example.com/test.css",
    ],
    type: web_webview.OfflineResourceType.CSS,
    responseHeaders: [
      { headerKey: "Content-Type", headerValue: "css" },
    ]
  },
  {
    localPath: "test.js",
    urlList: [ // 仅提供一个url，这个url既作为资源的源，也作为资源的网络请求地址
      "https://www.example.com/test.js",
    ],
    type: web_webview.OfflineResourceType.MODULE_JS,
    responseHeaders: [
    // 以<script crossorigin="anoymous" />方式使用，提供额外的响应头
      { headerKey: "Cross-Origin", headerValue:"anonymous" }
    ]
  },
];