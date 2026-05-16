import { describe, expect, it, TestType, Size, Level} from "@ohos/hypium";
import { connection, http } from "@kit.NetworkKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { JSON } from "@kit.ArkTS";

export const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";
const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

let tlsOptions_system : http.TlsOptions = 'system'
let tlsConfigPram01 :http.TlsConfig = {
  tlsVersionMin: http.TlsVersion.TLS_V_1_0,
  tlsVersionMax: http.TlsVersion.TLS_V_1_1,
  cipherSuites:[ 'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
    'TLS_RSA_WITH_3DES_EDE_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV11CipherSuite
  ]
}
let tlsConfigPram02 :http.TlsConfig = {
  tlsVersionMin: http.TlsVersion.TLS_V_1_2,
  tlsVersionMax: http.TlsVersion.TLS_V_1_3,
  cipherSuites:[
    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_AES_128_GCM_SHA256' as http.TlsV13SpecificCipherSuite as http.TlsV13CipherSuite,
  ]
}
let tlsOptions_config_01 : http.TlsOptions = tlsConfigPram01
let tlsOptions_config_02 : http.TlsOptions = tlsConfigPram02
let serverAuthentication: http.ServerAuthentication ={
  credential: {
    username: "proxy-username",
    password: "proxy-password"
  },
  authenticationType: "basic"
}

export default function HttpErrorCodeTest() {
  describe('HttpErrorCodeTest',  () => {
    /**
     * @tc.name   testHttpRequestMethodErrorCode0100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0100
     * @tc.desc   test http request(url, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode0100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('', (err: BusinessError, data: http.HttpResponse) => {
              ExpectTrue(err.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode0200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0200
     * @tc.desc   test http request(url, options, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode0200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('', {method: http.RequestMethod.POST}, (err: BusinessError, data: http.HttpResponse) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode0300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0300
     * @tc.desc   test http request(url, options, Promise) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode0300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.request('', {
              method: http.RequestMethod.GET,
            });
            promise.then((data:http.HttpResponse) => {
              console.info('Result:' + data.result);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode0400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0400
     * @tc.desc   test http requestInStream(url, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode0400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream('', (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestMethodErrorCode0500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0500
     * @tc.desc   test http requestInStream(url, options, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpRequestMethodErrorCode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrHttpRequestMethodErrorCode0500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream('', {method: http.RequestMethod.POST}, (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode0600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0600
     * @tc.desc   test http requestInStream(url, options, Promise) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode0600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.requestInStream('', {
              method: http.RequestMethod.GET,
            });
            promise.then((data) => {
              console.info('Result:' + data);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode0700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0700
     * @tc.desc   test http request(url, callback) with request error code 2300001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode0700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('ws://baidu.com', (err: BusinessError, data: http.HttpResponse) => {
              ExpectTrue(err.code == 2300001);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode0800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0800
     * @tc.desc   test http request(url, options, callback) with request error code 2300001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode0800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('ws://baidu.com', {method: http.RequestMethod.POST}, (err: BusinessError, data: http.HttpResponse) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300001);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode0900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0900
     * @tc.desc   test http request(url, options, Promise) with request error code 2300001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode0900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.request('ws://baidu.com', {
              method: http.RequestMethod.GET,
            });
            promise.then((data:http.HttpResponse) => {
              console.info('Result:' + data.result);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300001);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1000
     * @tc.desc   test http requestInStream(url, callback) with request error code 2300001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream('ws://baidu.com', (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300001);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1100
     * @tc.desc   test http requestInStream(url, options, callback) with request error code 2300001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream('ws://baidu.com', {method: http.RequestMethod.POST}, (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300001);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1200
     * @tc.desc   test http requestInStream(url, options, Promise) with request error code 2300001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.requestInStream('ws://baidu.com', {
              method: http.RequestMethod.GET,
            });
            promise.then((data) => {
              console.info('Result:' + data);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300001);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1300
     * @tc.desc   test http request(url, options, Promise) with request error code 2300005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let ExclusionList = "";
            let array = ExclusionList.split(',');
            let httpProxy: http.HttpProxy = {
              host: "host",
              port: 1,
              exclusionList: array
            };
            let promise = httpRequest.request('https://www.baidu.com', {
              usingProxy: httpProxy,
            });
            promise.then((data:http.HttpResponse) => {
              console.info('Result:' + data.result);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300005);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1400
     * @tc.desc   test http requestInStream(url, options, callback) with request error code 2300005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let ExclusionList = "";
            let array = ExclusionList.split(',');
            let httpProxy: http.HttpProxy = {
              host: "host",
              port: 1,
              exclusionList: array
            };
            httpRequest.requestInStream('https://www.baidu.com', {usingProxy: httpProxy,}, (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300005);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1500
     * @tc.desc   test http requestInStream(url, options, Promise) with request error code 2300005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let ExclusionList = "";
            let array = ExclusionList.split(',');
            let httpProxy: http.HttpProxy = {
              host: "host",
              port: 1,
              exclusionList: array
            };
            let promise = httpRequest.requestInStream('https://www.baidu.com', {usingProxy: httpProxy});
            promise.then((data) => {
              console.info('Result:' + data);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300005);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1600
     * @tc.desc   test http request(url, callback) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('127.0.0.1', (err: BusinessError, data: http.HttpResponse) => {
              ExpectTrue(err.code == 2300007);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1700
     * @tc.desc   test http request(url, options, callback) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testHttpRequestMethodErrorCode1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest = http.createHttp();
            httpRequest.request('127.0.0.1', {method: http.RequestMethod.POST}, (err: BusinessError, data: http.HttpResponse) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300007);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1800
     * @tc.desc   test http request(url, options, Promise) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.request('127.0.0.1', {
              method: http.RequestMethod.GET,
            });
            promise.then((data:http.HttpResponse) => {
              console.info('Result:' + data.result);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300007);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode1900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1900
     * @tc.desc   test http requestInStream(url, callback) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode1900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream('127.0.0.1', (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300007);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode2000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2000
     * @tc.desc   test http requestInStream(url, options, callback) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode2000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream('127.0.0.1', {method: http.RequestMethod.POST}, (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300007);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode2100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2100
     * @tc.desc   test http requestInStream(url, options, Promise) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode2100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.requestInStream('127.0.0.1', {
              method: http.RequestMethod.GET,
            });
            promise.then((data) => {
              console.info('Result:' + data);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300007);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode2200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2200
     * @tc.desc   test http request(url, options, Promise) with request error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode2200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.request(undefined, {
              method: http.RequestMethod.GET,
            });
            promise.then((data:http.HttpResponse) => {
              console.info('Result:' + data.result);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 401);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode2300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2300
     * @tc.desc   test http requestInStream(url, callback) with request error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode2300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(undefined, (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 401);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode2400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2400
     * @tc.desc   test http requestInStream(url, options, callback) with request error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode2400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(undefined, undefined, (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 401);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode2500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2500
     * @tc.desc   test http requestInStream(url, options, Promise) with request error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode2500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.requestInStream(undefined, {
              method: http.RequestMethod.GET,
            });
            promise.then((data) => {
              console.info('Result:' + data);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 401);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode2600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2600
     * @tc.desc   test http requestInStream(url, callback) with request error code 2300023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode2600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream("www.baidu.com", (err: BusinessError, data: number) => {
              if (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300023);
                done();
              } else {
                console.info(`${caseName} data: ${JSON.stringify(data)}`);
                ExpectTrue(false);
                done();
              }
            });
            httpRequest.destroy();
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode2700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2700
     * @tc.desc   test http requestInStream(url, options, callback) with request error code 2300023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode2700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream("www.baidu.com", {method: http.RequestMethod.GET}, (err: BusinessError, data: number) => {
              if (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300023);
                done();
              } else{
                console.info(`${caseName} data: ${JSON.stringify(data)}`);
                ExpectTrue(false);
                done();
              }
            });
            httpRequest.destroy();
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode3000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3000
     * @tc.desc   test http requestInStream(url, options, callback) with request error code 2300028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode3000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpRequestOptions: http.HttpRequestOptions = {
              readTimeout: 1
            }
            httpRequest.requestInStream("https://www.baidu.com", httpRequestOptions, (err: BusinessError, data: number) => {
              if (err) {
                console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300028);
                done();
              } else{
                console.info(`${caseName} data: ${JSON.stringify(data)}`);
                ExpectTrue(false);
                done();
              }
            });
            httpRequest.destroy();
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode3100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3100
     * @tc.desc   test http requestInStream(url, options, Promise) with request error code 2300028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode3100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpRequestOptions: http.HttpRequestOptions = {
              readTimeout: 1
            }
            httpRequest.requestInStream("https://www.baidu.com", httpRequestOptions).then((data: number) => {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(false);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300028);
              httpRequest.destroy();
              done();
            })
          }});
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest3200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3200
     * @tc.desc   Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let remoteValidation_system :http.RemoteValidation = 'system'

            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeFrom: 9999,
              resumeTo: 333,
              remoteValidation: remoteValidation_system,
              tlsOptions: tlsOptions_system,
              serverAuthentication:serverAuthentication
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('https://www.baidu.com', httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectTrue(false);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest3300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3300
     * @tc.desc   Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let remoteValidation_system :http.RemoteValidation = 'system'

            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeFrom: 9999,
              resumeTo: 333,
              remoteValidation: remoteValidation_system,
              tlsOptions: tlsOptions_config_02
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('https://www.baidu.com', httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectTrue(false);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest3400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3400
     * @tc.desc   Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let remoteValidation_system :http.RemoteValidation = 'system'

            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeFrom: 9999,
              resumeTo: 333,
              remoteValidation: remoteValidation_system,
              tlsOptions: tlsOptions_config_01
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('https://www.baidu.com', httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectTrue(false);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName}---End `);
    });
    
    /**
     * @tc.name   testHttpRequestMethodErrorCode3500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3500
     * @tc.desc   test http request(url, options, callback) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode3500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('https://hao123.com', {method: http.RequestMethod.POST}, (err: BusinessError, data: http.HttpResponse) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300060);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode3600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3600
     * @tc.desc   test http request(url, options, Promise) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode3600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.request('https://hao123.com', {
              method: http.RequestMethod.GET,
            });
            promise.then((data:http.HttpResponse) => {
              console.info('Result:' + data.result);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300060);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode3700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3700
     * @tc.desc   test http requestInStream(url, callback) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode3700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream('https://hao123.com', (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300060);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode3800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3800
     * @tc.desc   test http requestInStream(url, options, callback) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode3800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream('https://hao123.com', {method: http.RequestMethod.POST}, (err: BusinessError, data: number) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300060);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode3900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3900
     * @tc.desc   test http requestInStream(url, options, Promise) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode3900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.requestInStream('https://hao123.com', {
              method: http.RequestMethod.GET,
            });
            promise.then((data) => {
              console.info('Result:' + data);
            }).catch((err: BusinessError) => {
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err.code == 2300060);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodErrorCode4000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_4000
     * @tc.desc   test http request(url, callback) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestMethodErrorCode4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodErrorCode4000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('https://hao123.com', (err: BusinessError, data: http.HttpResponse) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300060);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });
})
}
