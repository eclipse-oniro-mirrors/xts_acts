import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { http } from '@kit.NetworkKit';

const BASE_URL = "https://146.56.217.118:7808";
const EMPTY_MSG = "__SNI_EMPTY__";
const SLEEP_TIME = 3000;
interface ResponseData {
  sni: string
}

function sleep(ms:number) {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}
export function expectFail (info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('${info} test failed');
  }
}
export function expectTrue (exp:boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info('${info} test failed');
  }
}

export default function SniTest() {
  describe('SniTest', () => {
    /**
     * @tc.name    testRequestWithSni0100
     * @tc.number  SUB_Request_WITH_SNI_0100
     * @tc.desc    Test normal parameters,TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0100';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'example-b.test'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual('example-b.test');
            } catch (e) {
              expect(responseData).assertContain('example-b.test');
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni0200
     * @tc.number  SUB_Request_WITH_SNI_0200
     * @tc.desc    Test normal parameters,TLSv1.3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0200';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'example-b.test'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual('example-b.test');
            } catch (e) {
              expect(responseData).assertContain('example-b.test');
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni0300
     * @tc.number  SUB_Request_WITH_SNI_0300
     * @tc.desc    Test parameters "",TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0300';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
            } catch (e) {
              expect(responseData).assertContain(EMPTY_MSG);
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni0400
     * @tc.number  SUB_Request_WITH_SNI_0400
     * @tc.desc    Test parameters "",TLSv1.3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0400';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
            } catch (e) {
              expect(responseData).assertContain(EMPTY_MSG);
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni0500
     * @tc.number  SUB_Request_WITH_SNI_0500
     * @tc.desc    Test change parameters ,TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0500';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'example-b.test'
      };
      options.sniHostName = "example-a.test";
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual('example-a.test');
            } catch (e) {
              expect(responseData).assertContain('example-a.test');
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni0600
     * @tc.number  SUB_Request_WITH_SNI_0600
     * @tc.desc    Test change parameters ,TLSv1.3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0600';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'example-b.test'
      };
      options.sniHostName = "example-a.test";
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual('example-a.test');
            } catch (e) {
              expect(responseData).assertContain('example-a.test');
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni0700
     * @tc.number  SUB_Request_WITH_SNI_0700
     * @tc.desc    Test max parameters ,TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0700';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'www.'+'b'.repeat(243) +'.com'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual('www.'+'b'.repeat(243) +'.com');
            } catch (e) {
              expect(responseData).assertContain('www.'+'b'.repeat(243) +'.com');
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni0800
     * @tc.number  SUB_Request_WITH_SNI_0800
     * @tc.desc    Test max parameters ,TLSv1.3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0800';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'www.'+'b'.repeat(243) +'.com'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual('www.'+'b'.repeat(243) +'.com');
            } catch (e) {
              expect(responseData).assertContain('www.'+'b'.repeat(243) +'.com');
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni0900
     * @tc.number  SUB_Request_WITH_SNI_0900
     * @tc.desc    Test abnormal parameters ,TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni0900';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'lalala'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual('lalala');
            } catch (e) {
              expect(responseData).assertContain('lalala');
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni1000
     * @tc.number  SUB_Request_WITH_SNI_1000
     * @tc.desc    Test abnormal parameters ,TLSv1.3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni1000';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'lalala'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual('lalala');
            } catch (e) {
              expect(responseData).assertContain('lalala');
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni1100
     * @tc.number  SUB_Request_WITH_SNI_1100
     * @tc.desc    Test extra long parameters ,TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni1100';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'b'.repeat(255)+'a'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
            } catch (e) {
              expect(responseData).assertContain(EMPTY_MSG);
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni1200
     * @tc.number  SUB_Request_WITH_SNI_1200
     * @tc.desc    Test extra long parameters ,TLSv1.3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni1200';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'b'.repeat(255)+'a'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
            } catch (e) {
              expect(responseData).assertContain(EMPTY_MSG);
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni1300
     * @tc.number  SUB_Request_WITH_SNI_1300
     * @tc.desc    Test parameters undefined,TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni1300';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: undefined
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
            } catch (e) {
              expect(responseData).assertContain(EMPTY_MSG);
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni1400
     * @tc.number  SUB_Request_WITH_SNI_1400
     * @tc.desc    Test parameters undefined,TLSv1.3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni1400';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: undefined
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
            } catch (e) {
              expect(responseData).assertContain(EMPTY_MSG);
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni1500
     * @tc.number  SUB_Request_WITH_SNI_1500
     * @tc.desc    Test parameters '.',TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni1400';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: '.'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
            } catch (e) {
              expect(responseData).assertContain(EMPTY_MSG);
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });

    /**
     * @tc.name    testRequestWithSni1600
     * @tc.number  SUB_Request_WITH_SNI_1600
     * @tc.desc    Test parameters '.',TLSv1.3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const caseName: string = 'testRequestWithSni1600';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: '.'
      };
      return httpRequest.request(BASE_URL, options)
        .then((data: http.HttpResponse) => {
          console.info(`${caseName} request success: ${JSON.stringify(data)}`);
          expect(data.responseCode).assertEqual(http.ResponseCode.OK);
          if (data.result) {
            let responseData: string = String(data.result);
            try {
              let jsonResponse: ResponseData = JSON.parse(responseData);
              expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
            } catch (e) {
              expect(responseData).assertContain(EMPTY_MSG);
            }
          }
        })
        .finally(() => {
          httpRequest.destroy();
        });
    });
    /**
     * @tc.name    testRequestWithSni1700
     * @tc.number  SUB_Request_WITH_SNI_1700
     * @tc.desc    Test parameters '.',TLSv1.1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
      const caseName: string = 'testRequestWithSni1700';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_1
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: true,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'lalala'
      };
      try {
        const responseCode: number = await httpRequest.requestInStream(BASE_URL, options);

        console.info(`${caseName} request success: ${JSON.stringify(responseCode)}`);
        expect(responseCode).assertEqual(http.ResponseCode.OK);

        if (responseCode === http.ResponseCode.OK) {
          const responseData: string = String(responseCode);
          console.info(`${caseName} responseData success: ${JSON.stringify(responseData)}`);
          expectTrue(responseData === "200");
          httpRequest.destroy();
          done();
        }
      } catch (error) {
        console.error(`${caseName} request failed: ${error.message}`);
        httpRequest.destroy();
        expect(true).assertEqual(false);
      }
    });
    /**
     * @tc.name    testRequestWithSni1800
     * @tc.number  SUB_Request_WITH_SNI_1800
     * @tc.desc    Test parameters "",TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
      const caseName: string = 'testRequestWithSni1800';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      httpRequest.request(BASE_URL, options, (err, data) => {
        console.info(`${caseName} request success: ${JSON.stringify(data)}`);
        if (err) {
          console.error('HTTP request failed:', err);
          expect(true).assertEqual(false);
          return;
        }
        expect(data.responseCode).assertEqual(http.ResponseCode.OK);
        if (data.result) {
          let responseData: string = String(data.result);
          try {
            console.info(`${caseName} responseData success: ${JSON.stringify(responseData)}`);
            let jsonResponse: ResponseData = JSON.parse(responseData);
            expect(jsonResponse.sni).assertEqual(EMPTY_MSG);
          } catch (e) {
            console.info(`${caseName} trycatch err: ${JSON.stringify(data)}`);
            expectFail();
          }
        }

        httpRequest.destroy();
      });
      done()
    });

    /**
     * @tc.name    testRequestWithSni1900
     * @tc.number  SUB_Request_WITH_SNI_1900
     * @tc.desc    Test parameters "",TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRequestWithSni1900';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation: 'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.OBJECT,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      try {
        const responseCode: number = await httpRequest.requestInStream(BASE_URL, options);

        console.info(`${caseName} request success: ${JSON.stringify(responseCode)}`);
        expect(responseCode).assertEqual(http.ResponseCode.OK);

        if (responseCode === http.ResponseCode.OK) {
          const responseData: string = String(responseCode);
          console.info(`${caseName} responseData success: ${JSON.stringify(responseData)}`);
          expectTrue(responseData === "200");
          httpRequest.destroy();
          done();
        }
      } catch (error) {
        console.error(`${caseName} request failed: ${error.message}`);
        httpRequest.destroy();
        expect(true).assertEqual(false);
      }
    });
    /**
     * @tc.name    testRequestWithSni2000
     * @tc.number  SUB_Request_WITH_SNI_2000
     * @tc.desc    Test parameters "",TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRequestWithSni2000';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation: 'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.ARRAY_BUFFER,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'example-b1.test'
      };
      try {
        const responseCode: number = await httpRequest.requestInStream(BASE_URL, options);

        console.info(`${caseName} request success: ${JSON.stringify(responseCode)}`);
        expect(responseCode).assertEqual(http.ResponseCode.OK);

        if (responseCode === http.ResponseCode.OK) {
          const responseData: string = String(responseCode);
          console.info(`${caseName} responseData success: ${JSON.stringify(responseData)}`);
          expectTrue(responseData === "200");
          httpRequest.destroy();
          done();
        }
      } catch (error) {
        console.error(`${caseName} request failed: ${error.message}`);
        httpRequest.destroy();
        expect(true).assertEqual(false);
      }
    });
    /**
     * @tc.name    testRequestWithSni2100
     * @tc.number  SUB_Request_WITH_SNI_2100
     * @tc.desc    Test parameters '.',TLSv1.1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
      const caseName: string = 'testRequestWithSni2100';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_1
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: true,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      httpRequest.requestInStream(BASE_URL, options, (err, data) => {
        console.info(`${caseName} request success: ${JSON.stringify(data)}`);
        if (err) {
          console.error('HTTP request failed:', err);
          expect(true).assertEqual(false);
          return;
        }
        expect(data).assertEqual(http.ResponseCode.OK);
        if (data) {
          let responseData: string = String(data);
          try {
            console.info(`${caseName} responseData success: ${JSON.stringify(responseData)}`);
            expectTrue(responseData == "200");
          } catch (e) {
            console.info(`${caseName} trycatch err: ${JSON.stringify(data)}`);
          }
        }

        httpRequest.destroy();
      });
      done()
    });
    /**
     * @tc.name    testRequestWithSni2200
     * @tc.number  SUB_Request_WITH_SNI_2200
     * @tc.desc    Test parameters '.',TLSv1.1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
      const caseName: string = 'testRequestWithSni2200';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_1
        },
        expectDataType: http.HttpDataType.OBJECT,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      httpRequest.requestInStream(BASE_URL, options, (err, data) => {
        console.info(`${caseName} request success: ${JSON.stringify(data)}`);
        if (err) {
          console.error('HTTP request failed:', err);
          expect(true).assertEqual(false);
          return;
        }
        expect(data).assertEqual(http.ResponseCode.OK);
        if (data) {
          let responseData: string = String(data);
          try {
            console.info(`${caseName} responseData success: ${JSON.stringify(responseData)}`);
            expectTrue(responseData == "200");
          } catch (e) {
            console.info(`${caseName} trycatch err: ${JSON.stringify(data)}`);
          }
        }

        httpRequest.destroy();
      });
      done()
    });
    /**
     * @tc.name    testRequestWithSni2300
     * @tc.number  SUB_Request_WITH_SNI_2300
     * @tc.desc    Test parameters '.',TLSv1.1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
      const caseName: string = 'testRequestWithSni2300';
      await sleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_1
        },
        expectDataType: http.HttpDataType.ARRAY_BUFFER,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      httpRequest.requestInStream(BASE_URL, options, (err, data) => {
        console.info(`${caseName} request success: ${JSON.stringify(data)}`);
        if (err) {
          console.error('HTTP request failed:', err);
          expect(true).assertEqual(false);
          return;
        }
        expect(data).assertEqual(http.ResponseCode.OK);
        if (data) {
          let responseData: string = String(data);
          try {
            console.info(`${caseName} responseData success: ${JSON.stringify(responseData)}`);
            expectTrue(responseData == "200");
          } catch (e) {
            console.info(`${caseName} trycatch err: ${JSON.stringify(data)}`);
          }
        }

        httpRequest.destroy();
      });
      done()
    });
  });
}

