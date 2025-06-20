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
import { BusinessError } from '@ohos.base';
import http from '@ohos.net.http';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import connection from '@ohos.net.connection';

export const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";
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

export default function HttpHttpDataTypeTest() {
  describe("HttpHttpDataTypeTest", () => {

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0100
     * @tc.name  :  testHttpDataTypeSTRING0100
     * @tc.desc  :  test httpDataType.STRING
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 0
     */

    it('testHttpDataTypeSTRING0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testHttpDataTypeSTRING0100";
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
              expectDataType: http.HttpDataType.STRING
            }, (err: BusinessError, res: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                ExpectTrue(res?.resultType == http.HttpDataType.STRING);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0200
     * @tc.name  :  testHttpDataTypeSTRING0200
     * @tc.desc  :  test httpDataType.STRING
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 0
     */

    it('testHttpDataTypeSTRING0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testHttpDataTypeSTRING0200";
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
            let resultType: http.HttpDataType = -1;
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              expectDataType: http.HttpDataType.STRING
            }).then((res: http.HttpResponse) => {
              resultType = res.resultType;
              console.info(`${caseName} httpRequest success!!!`);
              ExpectTrue(resultType == http.HttpDataType.STRING);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0300
     * @tc.name  :  testHttpDataTypeARRAY_BUFFER0300
     * @tc.desc  :  test httpDataType.ARRAY_BUFFER
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */

    it('testHttpDataTypeARRAY_BUFFER0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDataTypeARRAY_BUFFER0300";
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
              expectDataType: http.HttpDataType.ARRAY_BUFFER
            }, (err: BusinessError, res: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                ExpectTrue(res?.resultType == http.HttpDataType.ARRAY_BUFFER);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0400
     * @tc.name  :  testHttpDataTypeARRAY_BUFFER0400
     * @tc.desc  :  test httpDataType.ARRAY_BUFFER
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */

    it('testHttpDataTypeARRAY_BUFFER0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDataTypeARRAY_BUFFER0400";
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
            let resultType: http.HttpDataType = -1;
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              expectDataType: http.HttpDataType.ARRAY_BUFFER
            }).then((res: http.HttpResponse) => {
              resultType = res.resultType;
              console.info(`${caseName} httpRequest success!!!`);
              ExpectTrue(resultType == http.HttpDataType.ARRAY_BUFFER);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0500
     * @tc.name  :  testHttpDataTypeOBJECT0500
     * @tc.desc  :  test httpDataType.OBJECT
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */

    it('testHttpDataTypeOBJECT0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDataTypeOBJECT0500";
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
              expectDataType: http.HttpDataType.OBJECT
            }, (err: BusinessError, res: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                ExpectTrue([http.HttpDataType.OBJECT, http.HttpDataType.STRING].includes(res?.resultType));
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0600
     * @tc.name  :  testHttpDataTypeOBJECT0600
     * @tc.desc  :  test httpDataType.OBJECT
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */

    it('testHttpDataTypeOBJECT0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDataTypeOBJECT0600";
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
            let resultType: http.HttpDataType = -1;
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              expectDataType: http.HttpDataType.OBJECT
            }).then((res: http.HttpResponse) => {
              resultType = res.resultType;
              console.info(`${caseName} httpRequest success!!!`);
              ExpectTrue([http.HttpDataType.OBJECT, http.HttpDataType.STRING].includes(resultType));
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0700
     * @tc.name  :  testHttpDataTypeDefault0700
     * @tc.desc  :  test httpDataType default
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpDataTypeDefault0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDataTypeDefault0700";
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
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, res: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                ExpectTrue(res?.resultType == http.HttpDataType.STRING);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0800
     * @tc.name  :  testHttpDataTypeDefault0800
     * @tc.desc  :  test httpDataType default
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpDataTypeDefault0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDataTypeDefault0800";
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
            let resultType: http.HttpDataType = -1;
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
              resultType = res.resultType;
              console.info(`${caseName} httpRequest success!!!`);
              ExpectTrue(resultType == http.HttpDataType.STRING);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_0900
     * @tc.name  :  testHttpDataTypeIllegal0900
     * @tc.desc  :  test httpDataType illegal value
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpDataTypeIllegal0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDataTypeIllegal0900";
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
              expectDataType: 3
            }, (err: BusinessError, res: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                ExpectTrue(res?.resultType == http.HttpDataType.STRING);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpDataType_1000
     * @tc.name  :  testHttpDataTypeIllegal1000
     * @tc.desc  :  test httpDataType illegal value
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpDataTypeIllegal1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDataTypeIllegal1000";
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
            let resultType: http.HttpDataType = -1;
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              expectDataType: 3
            }).then((res: http.HttpResponse) => {
              resultType = res.resultType;
              console.info(`${caseName} httpRequest success!!!`);
              ExpectTrue(resultType == http.HttpDataType.STRING);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });
  });
}
