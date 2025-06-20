/*
 *  Copyright (c) 2024 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

export const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";
let httpRequestOptions_string: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" },
  multiFormDataList: [
    {
      name: "Part1",
      remoteFileName: "xtsRemoteTest",
      contentType: "string",
      data: "textyyyy",
    },
  ],
};

let httpRequestOptions_image: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" },
  multiFormDataList: [
    {
      name: "Part1",
      remoteFileName: "xtsRemoteTest",
      contentType: "image/png",
      data: "pic.png",
    },
  ],
};

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

export default function HttpMultiFormDataListTest() {
  describe("HttpMultiFormDataListTest", () => {
    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0100
     * @tc.name  : testHttpMultiFormDataList0100
     * @tc.desc  : test multiFormDataList with contentType(text/plain) hasData
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_string,
              (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectTrue(data.responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0200
     * @tc.name  : testHttpMultiFormDataList0200
     * @tc.desc  : test multiFormDataList with contentType(text/plain) hasData
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_string
            ).then((res: http.HttpResponse) => {
              console.info(`${caseName} httpRequest success ${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0300
     * @tc.name  : testHttpMultiFormDataList0300
     * @tc.desc  : test multiFormDataList with contentType(image/png) hasData
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_image,
              (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectTrue(data.responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0400
     * @tc.name  : testHttpMultiFormDataList0400
     * @tc.desc  : test multiFormDataList with contentType(text/plain) no data
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              multiFormDataList: [
                {
                  name: "multiTest",
                  remoteFileName: "xtsRemoteTest",
                  contentType: "text/plain",
                },
              ],
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName} httpRequest success ${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail err ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            })
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0500
     * @tc.name  : testHttpMultiFormDataList0500
     * @tc.desc  : test multiFormDataList with no data
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.POST,
                header: {
                  "Content-type": "multipart/form-data",
                },
                multiFormDataList: [
                  {
                    name: "multiTest",
                    remoteFileName: "xtsRemoteTest",
                    contentType: "text/plain",
                  },
                ],
              }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                done();
              }
            })
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0600
     * @tc.name  : testHttpMultiFormDataList0600
     * @tc.desc  : test multiFormDataList with no data
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.POST,
              header: {
                "Content-type": "multipart/form-data",
              },
              multiFormDataList: [
                {
                  name: "multiTest",
                  remoteFileName: "xtsRemoteTest",
                  contentType: "text/plain",
                },
              ],
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail err ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            })
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0700
     * @tc.name  : testHttpMultiFormDataList0700
     * @tc.desc  : test multiFormDataList with  filePath and data
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.POST,
                header: {
                  "Content-type": "multipart/form-data",
                },
                multiFormDataList: [
                  {
                    name: "multiTest",
                    contentType: "text/plain",
                    remoteFileName: "xtsRemoteTest",
                    data: "xtsTest",
                    filePath: "../../resources//base//media/icon.png",
                  },
                ],
              },
              (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectTrue(data.responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0800
     * @tc.name  : testHttpMultiFormDataList0800
     * @tc.desc  : test multiFormDataList with  filePath and data
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0800";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.POST,
              header: {
                "Content-type": "multipart/form-data",
              },
              multiFormDataList: [
                {
                  name: "multiTest",
                  remoteFileName: "xtsRemoteTest",
                  contentType: "text/plain",
                  data: "xtsTest",
                  filePath: "../../resources//base//media/icon.png",
                },
              ],
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail err ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            })
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0900
     * @tc.name  : testHttpMultiFormDataList0900
     * @tc.desc  : test multiFormDataList with  filePath
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList0900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList0900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.POST,
                header: {
                  "Content-type": "multipart/form-data",
                },
                multiFormDataList: [
                  {
                    name: "multiTest",
                    remoteFileName: "xtsRemoteTest",
                    contentType: "image/png",
                    filePath: "../../resources/base/media/icon.png",
                  },
                ],
              }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
                ExpectTrue(err.code==2300026);
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success:${JSON.stringify(data)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_1000
     * @tc.name  : testHttpMultiFormDataList1000
     * @tc.desc  : test multiFormDataList with  filePath
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpMultiFormDataList1000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.POST,
              header: {
                "Content-type": "multipart/form-data",
              },
              multiFormDataList: [
                {
                  name: "multiTest",
                  remoteFileName: "xtsRemoteTest",
                  contentType: "image/png",
                  filePath: "../../resources/base/media/icon.png",
                },
              ],
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName} httpRequest success:${JSON.stringify(data)}`);
              ExpectFail();
              httpRequest.destroy();
              done()
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code==2300026);
              httpRequest.destroy();
              done()
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });
  });
}
