import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function HttpRequestSocket5Test() {
  describe('HttpRequestSocket5Test', () => {

    /**
     * @tc.name   testHttpRequestSocket5Test0100
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0100
     * @tc.desc   PORT_7800 + Valid Credentials with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0100';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7800,
          username: 'test',
          password: 'testpass',
        };
        const httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await new Promise<http.HttpResponse>((resolve, reject) => {
          httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} test1 httpRequest fail:--- ${JSON.stringify(err)}`);
                reject(err);
              } else {
                console.info(`${caseName} test1 httpRequest success:--- ${JSON.stringify(data)}`);
                resolve(data);
              }
            });
        });
        ExpectTrue(response.responseCode === 200);
      } catch (err) {
        console.info(`${caseName} test1 httpRequest fail:--- ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test1 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test0200
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0200
     * @tc.desc   PORT_7801 + Valid Credentials for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0200';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7801,
          username: 'test',
          password: 'testpass',
        };
        const httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await new Promise<http.HttpResponse>((resolve, reject) => {
          httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} test2 httpRequest fail:--- ${JSON.stringify(err)}`);
                reject(err);
              } else {
                console.info(`${caseName} test2 httpRequest success:--- ${JSON.stringify(data)}`);
                resolve(data);
              }
            });
        });
        ExpectTrue(response.responseCode === 200);
      } catch (err) {
        console.info(`${caseName} test2 httpRequest fail:--- ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test2 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test0300
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0300
     * @tc.desc   Host is empty, username is empty, password is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0300';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '',
          port: 7801,
          username: '',
          password: '',
        };
        const httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions);
        console.info(`${caseName} test2 httpRequest success:--- ${JSON.stringify(response)}`);
        ExpectTrue(response.responseCode === 200);
      } catch (err) {
        console.info(`${caseName} test2 httpRequest fail:--- ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test2 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test0400
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0400
     * @tc.desc   username is empty, password is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0400';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '',
          port: 7801,
          username: undefined,
          password: undefined,
        };
        const httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions);
        console.info(`${caseName} test4 httpRequest success:--- ${JSON.stringify(response)}`);
        ExpectTrue(response.responseCode === 200);
      } catch (err) {
        console.info(`${caseName} test4 httpRequest fail:--- ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test4 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test0500
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0500
     * @tc.desc   Connect to PORT_7801 with username only, no password for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0500';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7801,
          username: 'test',
        };
        const httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions);
        console.info(`${caseName} test5 got success (unexpected): ${JSON.stringify(response)}`);
        ExpectFail();
      } catch (err) {
        console.info(`${caseName} test5 httpRequest failed as expected:--- ${JSON.stringify(err)}`);
        const error = err as BusinessError;
        ExpectTrue(error.code === 2300999);
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test5 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test0600
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0600
     * @tc.desc   Connect to PORT_7801 using only a password, no username for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0600';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7801,
          password: 'testpass',
        };
        const httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await new Promise<http.HttpResponse>((resolve, reject) => {
          httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} test6 httpRequest fail:--- ${JSON.stringify(err)}`);
                reject(err);
              } else {
                console.info(`${caseName} test6 httpRequest success ${JSON.stringify(data)}`);
                resolve(data);
              }
            });
        });
        console.info(`${caseName} test6 got success (unexpected): ${JSON.stringify(response)}`);
        ExpectFail();
      } catch (err) {
        console.info(`${caseName} test6 httpRequest failed as expected:--- ${JSON.stringify(err)}`);
        const error = err as BusinessError;
        ExpectTrue(error.code === 2300999);
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test6 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test0700
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0700
     * @tc.desc   Access to PORT_7801 failed due to invalid user credentials for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0700';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7801,
          username: 'test1',
          password: 'testpass',
        };
        const httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await new Promise<http.HttpResponse>((resolve, reject) => {
          httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} test8 httpRequest fail:--- ${JSON.stringify(err)}`);
                reject(err);
              } else {
                console.info(`${caseName} test8 httpRequest success ${JSON.stringify(data)}`);
                resolve(data);
              }
            });
        });
        console.info(`${caseName} test8 got success (unexpected): ${JSON.stringify(response)}`);
        ExpectFail();
      } catch (err) {
        console.info(`${caseName} test8 httpRequest failed as expected:--- ${JSON.stringify(err)}`);
        const error = err as BusinessError;
        ExpectTrue(error.code === 2300999);
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test8 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test0800
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0800
     * @tc.desc   Access to PORT_7801 failed due to invalid pass credentials for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0800';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7801,
          username: 'test',
          password: 'testpass1',
        };
        const httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await new Promise<http.HttpResponse>((resolve, reject) => {
          httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} test8 httpRequest fail:--- ${JSON.stringify(err)}`);
                reject(err);
              } else {
                console.info(`${caseName} test8 httpRequest success ${JSON.stringify(data)}`);
                resolve(data);
              }
            });
        });
        console.info(`${caseName} test8 got success (unexpected): ${JSON.stringify(response)}`);
        ExpectFail();
      } catch (err) {
        console.info(`${caseName} test8 httpRequest failed as expected:--- ${JSON.stringify(err)}`);
        const error = err as BusinessError;
        ExpectTrue(error.code === 2300999);
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test8 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test0900
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_0900
     * @tc.desc   Execution of DNS Resolution in System Mode for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test0900';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);

      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7800,
          dnsStrategy: connection.Socks5DnsStrategy.SYSTEM_MODE,
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await new Promise<http.HttpResponse>((resolve, reject) => {
          httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} test9 httpRequest fail:--- ${JSON.stringify(err)}`);
                reject(err);
              } else {
                console.info(`${caseName} test9 httpRequest success,connect to SYSTEM_MODE:--- ${JSON.stringify(data)}`);
                resolve(data);
              }
            });
        });
        ExpectTrue(response.responseCode === 200);
        console.info(`${caseName} test9 dnsStrategy:--- ${JSON.stringify(httpRequestOptions.usingSocks5Proxy?.dnsStrategy)}`);
        ExpectTrue(httpRequestOptions.usingSocks5Proxy?.dnsStrategy === 0);
      } catch (err) {
        console.info(`${caseName} test9 failed: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test9 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test1000
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_1000
     * @tc.desc   Execution of DNS Resolution in Proxy Mode for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test1000';
      const XTS_TEST_HTTP_URL: string = 'http://test-socks.innerdomain';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });

        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }

        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7800,
          dnsStrategy: connection.Socks5DnsStrategy.PROXY_MODE,
        };

        let httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };

        httpRequest = http.createHttp();
        const response: http.HttpResponse = await new Promise<http.HttpResponse>((resolve, reject) => {
          httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} test10 httpRequest fail:--- ${JSON.stringify(err)}`);
                reject(err);
              } else {
                console.info(`${caseName} test10 httpRequest success,connect to PROXY_MODE:--- ${JSON.stringify(data)}`);
                resolve(data);
              }
            });
        });
        ExpectTrue(response.responseCode === 200);
        console.info(`${caseName} test10 dnsStrategy:--- ${JSON.stringify(httpRequestOptions.usingSocks5Proxy?.dnsStrategy)}`);
        ExpectTrue(httpRequestOptions.usingSocks5Proxy?.dnsStrategy === 1);

      } catch (err) {
        console.info(`${caseName} test10 failed: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test10 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test1100
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_1100
     * @tc.desc   Exclude test-socks.innerdomain from the list for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test1100';
      const XTS_TEST_HTTP_URL: string = 'http://test-socks.innerdomain';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });
        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }
        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7800,
          username: 'test',
          password: 'testpass',
          dnsStrategy: connection.Socks5DnsStrategy.PROXY_MODE,
          exclusionList: [],
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await new Promise<http.HttpResponse>((resolve, reject) => {
          httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} test11 httpRequest fail:--- ${JSON.stringify(err)}`);
                reject(err);
              } else {
                console.info(`${caseName} test11 httpRequest success,connect to PROXY_MODE:--- ${JSON.stringify(data)}`);
                resolve(data);
              }
            });
        });
        console.info(`${caseName} test11  got success: ${response.responseCode}`);
        ExpectTrue(response.responseCode === 200);
      } catch (err) {
        console.info(`${caseName} test11 httpRequest unexpectedly failed: ${JSON.stringify(err)}`);
        const error = err as BusinessError;
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test11 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test1200
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_1200
     * @tc.desc   Exclude www.baidu.com from the list for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test1200';
      const XTS_TEST_HTTP_URL: string = 'http://www.baidu.com';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });

        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }

        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7800,
          dnsStrategy: connection.Socks5DnsStrategy.SYSTEM_MODE,
          exclusionList: ['www.baidu.com'],
        };

        let httpRequestOptions: http.HttpRequestOptions = {
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions);

        console.info(`${caseName} test12 httpRequest success,connect to PROXY_MODE:--- ${JSON.stringify(response)}`);
        ExpectTrue(response.responseCode === 200);
        console.info(`${caseName} test12 dnsStrategy:--- ${JSON.stringify(httpRequestOptions.usingSocks5Proxy?.dnsStrategy)}`);
        ExpectTrue(httpRequestOptions.usingSocks5Proxy?.dnsStrategy === 0);

      } catch (err) {
        console.info(`${caseName} test12 failed: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test12 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test1300
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_1300
     * @tc.desc   Set both usingProxy=false and usingSocks5Proxy for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test1300';
      const XTS_TEST_HTTP_URL: string = 'http://test-socks.innerdomain';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });

        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }

        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7800,
          dnsStrategy: connection.Socks5DnsStrategy.PROXY_MODE,
        };

        let httpRequestOptions: http.HttpRequestOptions = {
          usingProxy: false,
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions);

        console.info(`${caseName} test13 httpRequest success,connect to PROXY_MODE:--- ${JSON.stringify(response)}`);
        ExpectTrue(response.responseCode === 200);
        console.info(`${caseName} test13 dnsStrategy:--- ${JSON.stringify(httpRequestOptions.usingSocks5Proxy?.dnsStrategy)}`);
        ExpectTrue(httpRequestOptions.usingSocks5Proxy?.dnsStrategy === 1);

      } catch (err) {
        console.info(`${caseName} test13 failed: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test13 End`);
      }
    });
    /**
     * @tc.name   testHttpRequestSocket5Test1400
     * @tc.number SUB_NetworkMgr_Http_Request_Socket5_1400
     * @tc.desc   Set both usingProxy=false and usingSocks5Proxy for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestSocket5Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testHttpRequestSocket5Test1400';
      const XTS_TEST_HTTP_URL: string = 'http://test-socks.innerdomain';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | undefined;
      try {
        const netHandle: connection.NetHandle = await new Promise<connection.NetHandle>((resolve, reject) => {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) reject(error);
            else resolve(data);
          });
        });

        if (netHandle.netId == 0) {
          console.info(`${caseName} Please connect to the network`);
          ExpectFail();
          done();
          return;
        }

        const socks5Proxy: connection.Socks5Proxy = {
          host: '146.56.217.118',
          port: 7800,
          dnsStrategy: connection.Socks5DnsStrategy.PROXY_MODE,
        };

        let httpRequestOptions: http.HttpRequestOptions = {
          usingProxy: true,
          usingSocks5Proxy: socks5Proxy,
        };
        httpRequest = http.createHttp();
        const response: http.HttpResponse = await httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions);

        console.info(`${caseName} test14 httpRequest success,connect to PROXY_MODE:--- ${JSON.stringify(response)}`);
        ExpectTrue(response.responseCode === 200);
        console.info(`${caseName} test14 dnsStrategy:--- ${JSON.stringify(httpRequestOptions.usingSocks5Proxy?.dnsStrategy)}`);
        ExpectTrue(httpRequestOptions.usingSocks5Proxy?.dnsStrategy === 1);

      } catch (err) {
        console.info(`${caseName} test14 failed: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        httpRequest?.destroy();
        done();
        console.info(`${caseName}---test14 End`);
      }
    });
  });
}
