/*
 *  Copyright (c) 2024 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License")
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
import { BusinessError } from '@ohos.base';
import http from '@ohos.net.http';
import { describe, expect, it } from '@ohos/hypium';
import connection from '@ohos.net.connection';

export const ADDR_TEST_STREAM_HTTPS = "https://cn.bing.com/rp/Q5BJPjebyYN5QiqznkcMQmLrF9U.svg";

export const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";

/**
 * @description assert whether the input argument is true
 * @param data
 */
function ExpectTrue(data: Boolean): void {
  try {
    expect(data).assertTrue();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect true catch error, code: ${error.code}, message: ${error.message}`);
  }
}

/**
 * @description assert whether the input argument is false
 * @param data
 */
function ExpectFalse(data: Boolean): void {
  try {
    expect(data).assertFalse();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect false catch error, code: ${error.code}, message: ${error.message}`);
  }
}

/**
 * @description failure assertions
 */
function ExpectFail(): void {
  try {
    expect().assertFail();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect fail catch error, code: ${error.code}, message: ${error.message}`);
  }
}

const CODES: Array<http.ResponseCode> = [
  http.ResponseCode.OK, http.ResponseCode.CREATED, http.ResponseCode.ACCEPTED, http.ResponseCode.NOT_AUTHORITATIVE,
  http.ResponseCode.NO_CONTENT, http.ResponseCode.RESET, http.ResponseCode.PARTIAL, http.ResponseCode.MULT_CHOICE,
  http.ResponseCode.MOVED_PERM, http.ResponseCode.MOVED_TEMP, http.ResponseCode.SEE_OTHER, http.ResponseCode.NOT_MODIFIED,
  http.ResponseCode.USE_PROXY, http.ResponseCode.BAD_REQUEST, http.ResponseCode.UNAUTHORIZED, http.ResponseCode.PAYMENT_REQUIRED,
  http.ResponseCode.FORBIDDEN, http.ResponseCode.NOT_FOUND, http.ResponseCode.BAD_METHOD, http.ResponseCode.NOT_ACCEPTABLE,
  http.ResponseCode.PROXY_AUTH, http.ResponseCode.CLIENT_TIMEOUT, http.ResponseCode.CONFLICT, http.ResponseCode.LENGTH_REQUIRED,
  http.ResponseCode.ENTITY_TOO_LARGE, http.ResponseCode.REQ_TOO_LONG, http.ResponseCode.PRECON_FAILED, http.ResponseCode.UNSUPPORTED_TYPE,
  http.ResponseCode.INTERNAL_ERROR, http.ResponseCode.NOT_IMPLEMENTED, http.ResponseCode.BAD_GATEWAY, http.ResponseCode.UNAVAILABLE,
  http.ResponseCode.GATEWAY_TIMEOUT, http.ResponseCode.VERSION
];


export default function HttpResponsePropertiesTest() {
  describe("HttpResponsePropertiesTest", () => {
    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0100
     * @tc.name  :  SUB_NetworkMgr_Http_Response_0100
     * @tc.desc  :  test resultType with default parameter for expectDataType
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 3
    */
    it('testHttpResponse0100', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0100";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName} res.resultType:${res.resultType} res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(resultType == http.HttpDataType.STRING);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0200
     * @tc.name  :  SUB_NetworkMgr_Http_Response_0200
     * @tc.desc  :  test resultType with expectDataType:http.HttpDataType.STRING
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testHttpResponse0200', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0200";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      const expectDataType: http.HttpDataType = http.HttpDataType.STRING;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType,
              }).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(resultType == expectDataType);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0300
     * @tc.name  :  SUB_NetworkMgr_Http_Response_0300
     * @tc.desc  :  test resultType with expectDataType:http.HttpDataType.OBJECT
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testHttpResponse0300', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0300";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      const expectDataType: http.HttpDataType = http.HttpDataType.OBJECT;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType,
              }).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                const flag: boolean = [http.HttpDataType.OBJECT, http.HttpDataType.STRING].includes(resultType);
                ExpectTrue(flag);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0400
     * @tc.name  :  SUB_NetworkMgr_Http_Response_0400
     * @tc.desc  :  test resultType with expectDataType:http.HttpDataType.ARRAY_BUFFER
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testHttpResponse0400', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0400";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      const expectDataType: http.HttpDataType = http.HttpDataType.ARRAY_BUFFER;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType,
              }).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(resultType == expectDataType);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0500
     * @tc.name:    testHttpResponse0500
     * @tc.desc:    test resultType with expectDataType:not within http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse005', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0500";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      const expectDataType: http.HttpDataType = 3;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType,
              }).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(resultType == http.HttpDataType.STRING);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0600
     * @tc.name:    testHttpResponse0600
     * @tc.desc:    test resultType with header.contentType(application/json) Type
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse0600', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0600";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                header: {
                  "content-type": "application/json"
                },
              }).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(resultType == http.HttpDataType.STRING);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0700
     * @tc.name:    testHttpResponse0700
     * @tc.desc:    test resultType with header.contentType(application/octet-stream) Type
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse007', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0700";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                header: {
                  "content-type": "application/octet-stream"
                },
              }).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(resultType == http.HttpDataType.ARRAY_BUFFER);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0800
     * @tc.name:    testHttpResponse0800
     * @tc.desc:    test resultType with header.contentType(image/svg+xml) Type
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse0800', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0800";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                header: {
                  "content-type": "image/svg+xml"
                },
              }).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName}  res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(resultType == http.HttpDataType.ARRAY_BUFFER);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_0900
     * @tc.name:    testHttpResponse0900
     * @tc.desc:    test resultType with header.contentType(text/html) Type
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse0900', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse0900";
      console.info(`${caseName} test Start`);
      let resultType: http.HttpDataType = -1;
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                header: {
                  "content-type": "text/html"
                },
              }).then((res: http.HttpResponse) => {
                resultType = res.resultType;
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(resultType == http.HttpDataType.STRING);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request catch ERROR-->:${JSON.stringify(error)}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1000
     * @tc.name:    testHttpResponse1000
     * @tc.desc:    test resultType with default parameter for expectDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1000', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  ExpectTrue(resultType == http.HttpDataType.STRING);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1100
     * @tc.name:    testHttpResponse1100
     * @tc.desc:    test resultType with expectDataType:http.HttpDataType.STRING
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1100', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              const expectDataType: http.HttpDataType = http.HttpDataType.STRING;
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType,
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  ExpectTrue(resultType == expectDataType);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1200
     * @tc.name:    testHttpResponse1200
     * @tc.desc:    test resultType with expectDataType:http.HttpDataType.OBJECT
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1200', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              const expectDataType: http.HttpDataType = http.HttpDataType.OBJECT;
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType,
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  const flag: boolean = [http.HttpDataType.OBJECT, http.HttpDataType.STRING].includes(resultType);
                  ExpectTrue(flag);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1300
     * @tc.name:    testHttpResponse1300
     * @tc.desc:    test resultType with expectDataType:http.HttpDataType.ARRAY_BUFFER
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1300', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              const expectDataType: http.HttpDataType = http.HttpDataType.ARRAY_BUFFER;
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType,
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  ExpectTrue(resultType == expectDataType);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1400
     * @tc.name:    testHttpResponse1400
     * @tc.desc:    test resultType with expectDataType:not within http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1400', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              const expectDataType: http.HttpDataType = 3;
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType,
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  ExpectTrue(resultType == http.HttpDataType.STRING);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1500
     * @tc.name:    testHttpResponse1500
     * @tc.desc:    test resultType with header.contentType(application/json)
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1500', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                header: {
                  "content-type": "application/json"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  ExpectTrue(resultType == http.HttpDataType.STRING);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1600
     * @tc.name:    testHttpResponse1600
     * @tc.desc:    test resultType with header.contentType(application/octet-stream)
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1600', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                header: {
                  "content-type": "application/octet-stream"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  ExpectTrue(resultType == http.HttpDataType.ARRAY_BUFFER);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1700
     * @tc.name:    testHttpResponse1700
     * @tc.desc:    test resultType with header.contentType(image/svg+xml)
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1700', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                header: {
                  "content-type": "image/svg+xml"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  ExpectTrue(resultType == http.HttpDataType.ARRAY_BUFFER);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1800
     * @tc.name:    testHttpResponse1800
     * @tc.desc:    test resultType with header.contentType(text/html)
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1800', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let resultType: http.HttpDataType = -1;
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                header: {
                  "content-type": "text/html"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data -->:${JSON.stringify(data)}`);
                  resultType = res.resultType;
                  ExpectTrue(resultType == http.HttpDataType.STRING);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_1900
     * @tc.name:    testHttpResponse1900
     * @tc.desc:    test result expect type string expectDataType within http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse1900', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse1900";
      console.info(`${caseName} test Start`);
      const httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType: http.HttpDataType.STRING,
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                const type: string = typeof res?.result;
                ExpectTrue(type == 'string');
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2000
     * @tc.name:    testHttpResponse2000
     * @tc.desc:    test result expect type object expectDataType within http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2000', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2000";
      console.info(`${caseName} test Start`);
      const httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType: http.HttpDataType.OBJECT,
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                const type: string = typeof res?.result;
                const flag: boolean = ['string', 'object', 'undefined'].includes(type);
                ExpectTrue(flag);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2100
     * @tc.name:    testHttpResponse2100
     * @tc.desc:    test result expect type ArrayBuffer expectDataType within http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2100', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2100";
      console.info(`${caseName} test Start`);
      const httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType: http.HttpDataType.ARRAY_BUFFER,
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                const flag: boolean = res?.result instanceof ArrayBuffer;
                ExpectTrue(flag);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2200
     * @tc.name:    testHttpResponse2200
     * @tc.desc:    test result expect type string  expectDataType beyond http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2200', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType: 3,
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName}  res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                const flag: boolean = typeof res?.result == 'string';
                ExpectTrue(flag);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2300
     * @tc.name:    testHttpResponse2300
     * @tc.desc:    test result with header.contentType(application/json) type
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2300', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                header: {
                  "content-type": "application/json"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                const type: string = typeof res?.result;
                ExpectTrue(type == 'string');
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2400
     * @tc.name:    testHttpResponse2400
     * @tc.desc:    test result with header.contentType(application/octet-stream) type
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2400', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                header: {
                  "content-type": "application/octet-stream"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(res?.result instanceof ArrayBuffer);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2500
     * @tc.name:    testHttpResponse2500
     * @tc.desc:    test result with header.contentType(image/svg+xml) type
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2500', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                header: {
                  "content-type": "image/svg+xml"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(res?.result instanceof ArrayBuffer);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2600
     * @tc.name:    testHttpResponse2600
     * @tc.desc:    test result with header.contentType(text/html) type
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2600', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                header: {
                  "content-type": "text/html"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(typeof res?.result == 'string');
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2700
     * @tc.name:    testHttpResponse2700
     * @tc.desc:    test result expect type string expectDataType within http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2700', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType: http.HttpDataType.STRING,
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(typeof res?.result == 'string');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2800
     * @tc.name:    testHttpResponse2800
     * @tc.desc:    test result expect type object expectDataType within http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2800', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType: http.HttpDataType.OBJECT,
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  const flag: boolean = ['string', 'object', 'undefined'].includes(typeof res?.result);
                  ExpectTrue(flag);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_2900
     * @tc.name:    testHttpResponse2900
     * @tc.desc:    test result expect type ArrayBuffer expectDataType within http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse2900', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse2900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType: http.HttpDataType.ARRAY_BUFFER,
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(res?.result instanceof ArrayBuffer);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3000
     * @tc.name:    testHttpResponse3000
     * @tc.desc:    test result expect type string  expectDataType beyond http.HttpDataType
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3000', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                expectDataType: 3,
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(typeof res?.result == 'string');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3100
     * @tc.name:    testHttpResponse3100
     * @tc.desc:    test result  header.contentType(application/json)
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3100', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                header: {
                  "content-type": "application/json"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(typeof res?.result == 'string');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3200
     * @tc.name:    testHttpResponse3200
     * @tc.desc:    test result header.contentType(application/octet-stream)
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3200', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                header: {
                  "content-type": "application/octet-stream"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(res?.result instanceof ArrayBuffer);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3300
     * @tc.name:    testHttpResponse3300
     * @tc.desc:    test result header.contentType(image/svg+xml)
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3300', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                header: {
                  "content-type": "image/svg+xml"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(res?.result instanceof ArrayBuffer);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3400
     * @tc.name:    testHttpResponse3400
     * @tc.desc:    test result header.contentType(image/apng)
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3400', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                header: {
                  "content-type": "text/html"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(typeof res?.result == 'string');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3500
     * @tc.name:    testHttpResponse3500
     * @tc.desc:    test responseCode with success request
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3500', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3500";
      console.info(`${caseName} test Start`);
      const httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.responseCode:${res?.responseCode}`);
                ExpectTrue(CODES.includes(res?.responseCode));
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3600
     * @tc.name:    testHttpResponse3600
     * @tc.desc:    test responseCode with fail request
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3600', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request("abc").then((res: http.HttpResponse) => {
                console.info(`${caseName} res.responseCode: ${res?.responseCode}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectTrue(error.code == 2300006);
                done();
              })
            }
          }
        });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3700
     * @tc.name:    testHttpResponse3700
     * @tc.desc:    test responseCode with success request
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3700', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(CODES.includes(res?.responseCode));
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3800
     * @tc.name:    testHttpResponse3800
     * @tc.desc:    test responseCode with fail request
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3800', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request("abc", (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request error code: ${err.code}, msg: ${err.message}`);
                  ExpectTrue(err.code == 2300006);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_3900
     * @tc.name:    testHttpResponse3900
     * @tc.desc:    test header expect value with type Object
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse3900', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse3900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.header:${JSON.stringify(res.header)}`);
                ExpectTrue(res?.header instanceof Object);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_4000
     * @tc.name:    testHttpResponse4000
     * @tc.desc:    test header  expect value with type Object
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse4000', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.log(`${caseName} res.header: ${JSON.stringify(res.header)}`)
                  ExpectTrue(res?.header instanceof Object);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_4100
     * @tc.name:    testHttpResponse4100
     * @tc.desc:    test cookies  expect value with type string
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpResponse4100', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.cookies:${JSON.stringify(res.cookies)}`);
                ExpectTrue(typeof res?.cookies == 'string');
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_4200
     * @tc.name:    testHttpResponse4200
     * @tc.desc:    test cookies  expect value with type string
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpResponse4200', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(typeof res?.cookies == 'string');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_4300
     * @tc.name:    testHttpResponse4300
     * @tc.desc:    test performanceTiming
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse4300', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4300";
      console.info(`${caseName} test Start`);
      const httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
                ExpectTrue(res.performanceTiming.dnsTiming >= 0);
                ExpectTrue(res.performanceTiming.tcpTiming >= 0);
                ExpectTrue(res.performanceTiming.tlsTiming >= 0);
                ExpectTrue(res.performanceTiming.firstSendTiming >= 0);
                ExpectTrue(res.performanceTiming.firstReceiveTiming >= 0);
                ExpectTrue(res.performanceTiming.totalFinishTiming >= 0);
                ExpectTrue(res.performanceTiming.redirectTiming >= 0);
                ExpectTrue(res.performanceTiming.responseHeaderTiming >= 0);
                ExpectTrue(res.performanceTiming.responseBodyTiming >= 0);
                ExpectTrue(res.performanceTiming.totalTiming >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_Response_4400
     * @tc.name:    testHttpResponse4400
     * @tc.desc:    test performanceTiming
     * @tc.size:    SmallTest
     * @tc.type:    Function
     * @tc.level:   level 3
     */
    it('testHttpResponse4400', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
                  ExpectTrue(res.performanceTiming.dnsTiming >= 0);
                  ExpectTrue(res.performanceTiming.tcpTiming >= 0);
                  ExpectTrue(res.performanceTiming.tlsTiming >= 0);
                  ExpectTrue(res.performanceTiming.firstSendTiming >= 0);
                  ExpectTrue(res.performanceTiming.firstReceiveTiming >= 0);
                  ExpectTrue(res.performanceTiming.totalFinishTiming >= 0);
                  ExpectTrue(res.performanceTiming.redirectTiming >= 0);
                  ExpectTrue(res.performanceTiming.responseHeaderTiming >= 0);
                  ExpectTrue(res.performanceTiming.responseBodyTiming >= 0);
                  ExpectTrue(res.performanceTiming.totalTiming >= 0);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_4500
    * @tc.name:    testHttpResponse4500
    * @tc.desc:    test result header.contentType(application/octet-stream) and expectDataType(type string)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse4500', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: http.HttpDataType.STRING,
                header: {
                  "content-type": "application/octet-stream"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(typeof res?.result == 'string');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_4600
    * @tc.name:    testHttpResponse4600
    * @tc.desc:    test result header.contentType(application/json) and expectDataType(type buffer)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse4600', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: http.HttpDataType.ARRAY_BUFFER,
                header: {
                  "content-type": "application/json"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(res?.result instanceof ArrayBuffer);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_4700
    * @tc.name:    testHttpResponse4700
    * @tc.desc:    test result header.contentType(application/octet-stream) and expectDataType(type 3)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse4700', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: 3,
                header: {
                  "content-type": "application/octet-stream"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(res?.result instanceof ArrayBuffer);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_4800
    * @tc.name:    testHttpResponse4800
    * @tc.desc:    test result header.contentType(application/json) and expectDataType(type string)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse4800', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: http.HttpDataType.STRING,
                header: {
                  "content-type": "application/json"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(typeof res?.result == 'string');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_4900
    * @tc.name:    testHttpResponse4900
    * @tc.desc:    test result header.contentType(application/json) and expectDataType(type 3)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse4900', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse4900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: 3,
                header: {
                  "content-type": "application/json"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(res?.result instanceof ArrayBuffer);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_5000
    * @tc.name:    testHttpResponse5000
    * @tc.desc:    test result header.contentType(text/html) and expectDataType(type 3)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse5000', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse5000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: 3,
                header: {
                  "content-type": "text/html"
                }
              }, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request data-->:${JSON.stringify(res)}`);
                  ExpectTrue(res?.result instanceof ArrayBuffer);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_5100
    * @tc.name:    testHttpResponse5100
    * @tc.desc:    test result header.contentType(application/octet-stream) and expectDataType(type string)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse5100', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse5100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: http.HttpDataType.STRING,
                header: {
                  "content-type": "application/octet-stream"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(typeof res?.result == 'string');
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_5200
    * @tc.name:    testHttpResponse5200
    * @tc.desc:    test result header.contentType(application/json) and expectDataType(type buffer)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse5200', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse5200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: http.HttpDataType.ARRAY_BUFFER,
                header: {
                  "content-type": "application/json"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(res?.result instanceof ArrayBuffer);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_5300
    * @tc.name:    testHttpResponse5300
    * @tc.desc:    test result header.contentType(application/octet-stream) and expectDataType(type 3)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse5300', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse5300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: 3,
                header: {
                  "content-type": "application/octet-stream"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(res?.result instanceof ArrayBuffer);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_5400
    * @tc.name:    testHttpResponse5400
    * @tc.desc:    test result header.contentType(application/json) and expectDataType(type string)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse5400', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse5400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: http.HttpDataType.STRING,
                header: {
                  "content-type": "application/json"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(typeof res?.result == 'string')
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_5500
    * @tc.name:    testHttpResponse5500
    * @tc.desc:    test result header.contentType(application/json) and expectDataType(type 3)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse5500', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse5500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: 3,
                header: {
                  "content-type": "application/json"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(res?.result instanceof ArrayBuffer);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_Response_5600
    * @tc.name:    testHttpResponse5600
    * @tc.desc:    test result header.contentType(text/html) and expectDataType(type 3)
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 3
    */
    it('testHttpResponse5600', 0, async (done: Function) => {
      const caseName: string = "testHttpResponse5600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              const httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_STREAM_HTTPS, {
                expectDataType: 3,
                header: {
                  "content-type": "text/html"
                }
              }).then((res: http.HttpResponse) => {
                console.info(`${caseName} res.resultType:${res.resultType}  res.result:${JSON.stringify(res.result)}`);
                ExpectTrue(res?.result instanceof ArrayBuffer);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });
  });
}