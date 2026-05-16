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

export const ADDR_TEST_DOMAIN_HTTPS: string = "https://www.baidu.com/";
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
let httpRequestOptions_string1: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" },
  multiFormDataList: [
  ],
};
let httpRequestOptions_string2: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" },
  multiFormDataList: [
    {
      name: "",
      remoteFileName: "xtsRemoteTest",
      contentType: "image/png",
      data: "pic.png",
    },
  ],
};
let httpRequestOptions_string3: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" },
  multiFormDataList: [
    {
      name: "Part1",
      remoteFileName: "xtsRemoteTest",
      contentType: "",
      data: "pic.png",
    },
  ],
};
let httpRequestOptions_string4: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" },
  multiFormDataList: [
    {
      name: "Part1",
      remoteFileName: "",
      contentType: "image/png",
      data: "pic.png",
    },
  ],
};
let httpRequestOptions_string5: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" },
  multiFormDataList: [
    {
      name: "Part1",
      remoteFileName: "xtsRemoteTest",
      contentType: "image/png",
      data: "",
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
     * @tc.name   testHttpMultiFormDataList0100
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0100
     * @tc.desc   test multiFormDataList with contentType(text/plain) hasData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList0200
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0200
     * @tc.desc   test multiFormDataList with contentType(text/plain) hasData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList0300
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0300
     * @tc.desc   test multiFormDataList with contentType(image/png) hasData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList0400
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0400
     * @tc.desc   test multiFormDataList with contentType(text/plain) no data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList0500
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0500
     * @tc.desc   test multiFormDataList with no data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList0600
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0600
     * @tc.desc   test multiFormDataList with no data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList0700
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0700
     * @tc.desc   test multiFormDataList with  filePath and data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList0800
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0800
     * @tc.desc   test multiFormDataList with  filePath and data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList0900
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0900
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testHttpMultiFormDataList1000
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1000
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
    /**
     * @tc.name   testHttpMultiFormDataList1100
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1100
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1100";
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
              httpRequestOptions_string1,
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
     * @tc.name   testHttpMultiFormDataList1200
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1200
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1200";
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
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string1).then((res) => {
              console.info(`${caseName} data: --- ${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              console.info(`${caseName} httpRequest success ${JSON.stringify(res)}`);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} catch ERROR: ${JSON.stringify(err)}`);
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
     * @tc.name   testHttpMultiFormDataList1300
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1300
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1300";
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
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_string1,
              (err: BusinessError, data: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${data}`);
                  ExpectTrue(data == 200);
                  httpRequest.destroy();
                  done();
                }
              }
            );
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
     * @tc.name   testHttpMultiFormDataList1400
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1400
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpMultiFormDataList1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHttpMultiFormDataList1400';
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
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string1)
              .then((responseCode: number) => {
                console.info(`${caseName} httpRequest success responseCode: ${responseCode}`);
                ExpectTrue(responseCode == 200);
                httpRequest.destroy();
                done();
              })
              .catch((err: BusinessError) => {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
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
     * @tc.name   testHttpMultiFormDataList1500
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1500
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1500";
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
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_string,
              (err: BusinessError, streamId: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success, streamId: ${streamId}`);
                  ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList1600
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1600
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1600";
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
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string)
              .then((responseCode: number) => {
                console.info(`${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                ExpectTrue(responseCode === 200);
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
     * @tc.name   testHttpMultiFormDataList1700
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1700
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1700";
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
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_string2,
              (err: BusinessError, streamId: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success, streamId: ${streamId}`);
                  ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList1800
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1800
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1800";
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
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string2)
              .then((responseCode: number) => {
                console.info(`${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                ExpectTrue(responseCode === 200);
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
     * @tc.name   testHttpMultiFormDataList1900
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1900
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList1900";
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
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_string3,
              (err: BusinessError, streamId: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success, streamId: ${streamId}`);
                  ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList2000
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2000
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2000";
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
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string3)
              .then((responseCode: number) => {
                console.info(`${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                ExpectTrue(responseCode === 200);
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
     * @tc.name   testHttpMultiFormDataList2100
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2100
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2100";
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
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_string4,
              (err: BusinessError, streamId: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success, streamId: ${streamId}`);
                  ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList2200
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2200
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2200";
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
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string4)
              .then((responseCode: number) => {
                console.info(`${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                ExpectTrue(responseCode === 200);
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
     * @tc.name   testHttpMultiFormDataList2300
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2300
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2300";
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
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              httpRequestOptions_string5,
              (err: BusinessError, streamId: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success, streamId: ${streamId}`);
                  ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList2400
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2400
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2400";
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
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string5)
              .then((responseCode: number) => {
                console.info(`${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                ExpectTrue(responseCode === 200);
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
     * @tc.name   testHttpMultiFormDataList2500
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2500
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2500";
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
                    filePath: "",
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
     * @tc.name   testHttpMultiFormDataList2600
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2600
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2600";
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
                  filePath: "",
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
     * @tc.name   testHttpMultiFormDataList2700
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2700
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2700";
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
            httpRequest.requestInStream(
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
                    data: "xtsTest",
                    filePath: "",
                  },
                ],
              },
              (err: BusinessError, responseCode: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success, responseCode: ${responseCode}`);
                  ExpectTrue(responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              }
            );
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
     * @tc.name   testHttpMultiFormDataList2800
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2800
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testHttpMultiFormDataList2800";
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
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, {
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
                  filePath: "",
                },
              ],
            }).then((responseCode: number) => {
              console.info(`${caseName} httpRequest success, responseCode: ${responseCode}`);
              ExpectTrue(responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail err ${JSON.stringify(err)}`);
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
  });
}
