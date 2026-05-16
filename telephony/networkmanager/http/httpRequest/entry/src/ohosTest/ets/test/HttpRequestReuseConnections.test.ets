import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { http } from '@kit.NetworkKit';
import connection from '@ohos.net.connection';

let ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

export default function HttpRequestReuseConnectionsTest() {
  describe('HttpRequestReuseConnectionsTest', () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest0100
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0100
     * @tc.desc   Write a parameter with `reuseConnections` set to `true` for stream multiplexing for callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest0100';
      console.info(`${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json'},
          reuseConnections: true,
        };
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, options,(err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL,options, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} options is `+JSON.stringify(options));
                        ExpectTrue(options.reuseConnections == true);
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                        httpRequest.destroy();
                        done();
                      }
                    });
                  }
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest0200
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0200
     * @tc.desc   Write a parameter with `reuseConnections` set to `false` for no stream multiplexing for callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest0200';
      console.info(`${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json'},
          reuseConnections: false,
        };
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, options,(err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL,options, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} options is `+JSON.stringify(options));
                        ExpectTrue(options.reuseConnections == false);
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        ExpectTrue(data?.performanceTiming.tcpTiming > 0);
                        httpRequest.destroy();
                        done();
                      }
                    });
                  }
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest0300
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0300
     * @tc.desc   Write a parameter with `reuseConnections` set to `undefined` for no stream multiplexing for callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest0300';
      console.info(`${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json'},
          reuseConnections: undefined,
        };
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, options,(err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL,options, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} options is `+JSON.stringify(options));
                        ExpectTrue(options.reuseConnections == undefined);
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                        httpRequest.destroy();
                        done();
                      }
                    });
                  }
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest0400
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0400
     * @tc.desc   Write a parameter with `reuseConnections` set to `true` for stream multiplexing for promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest0400';
      console.info(`${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json'},
          reuseConnections: true,
        };
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
              console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
            const secondRequest: () => void = () => {
              httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
                console.info(`${caseName} options is `+JSON.stringify(options));
                ExpectTrue(options.reuseConnections == true);
                console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              });
            }
            setTimeout(() => {
              secondRequest();
            }, 10000);
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest0500
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0500
     * @tc.desc   Write a parameter with `reuseConnections` set to `false` for no stream multiplexing for promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest0500';
      console.info(`${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json'},
          reuseConnections: false,
        };
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
              console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
            const secondRequest: () => void = () => {
              httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
                console.info(`${caseName} options is `+JSON.stringify(options));
                ExpectTrue(options.reuseConnections == false);
                console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                ExpectTrue(data?.performanceTiming.tcpTiming > 0);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              });
            }
            setTimeout(() => {
              secondRequest();
            }, 10000);
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest0600
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0600
     * @tc.desc   Write a parameter with `reuseConnections` set to `undefined` for no stream multiplexing for promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest0600';
      console.info(`${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json'},
          reuseConnections: undefined,
        };
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
              console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
            const secondRequest: () => void = () => {
              httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
                console.info(`${caseName} options is `+JSON.stringify(options));
                ExpectTrue(options.reuseConnections == undefined);
                console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              });
            }
            setTimeout(() => {
              secondRequest();
            }, 10000);
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
  });
}

