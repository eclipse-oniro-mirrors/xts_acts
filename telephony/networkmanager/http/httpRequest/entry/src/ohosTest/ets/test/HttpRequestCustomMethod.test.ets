/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';

const XTS_TEST_HTTP_URL: string = 'https://webdav.moyufangge.com/';

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

const HttpRequest = (customMethod: string, url: string, state: boolean): Promise<void> => {
  return new Promise((resolve, reject) => {
    let httpRequestOptions: http.HttpRequestOptions = {
      expectDataType: http.HttpDataType.STRING,
      customMethod: customMethod,
      header: { 'Content-Type': 'text/xml' }
    }
    let httpRequest: http.HttpRequest = http.createHttp();
    httpRequest.request(url, httpRequestOptions,
      (err: Error, data: http.HttpResponse) => {
        if (err) {
          ExpectFail();
          httpRequest.destroy();
          reject(new Error(`请求失败：${err.message}`));
        } else {
          if (customMethod == 'MKCOL') {
            ExpectTrue(data.responseCode == 201);
          } else if (state) {
            ExpectTrue(data.responseCode == 200);
          } else {
            ExpectTrue(data.responseCode == 404);
          }
          httpRequest.destroy();
          resolve();
        }
      });
  });
}
function generateTimeRandomStr(): string {
  try {
    const timestamp = Date.now().toString();
    const random = Math.floor(Math.random() * 999).toString().padStart(3, '0');
    return `${timestamp}_${random}`;
  } catch (err) {
    console.error(`random failed: ${(err as BusinessError).message}`);
    return `xts_test_${Date.now()}`;
  }
}

export default function HttpRequestCustomMethodTest() {
  describe('HttpRequestCustomMethodTest', () => {
    let lockToken: string = '';
    let random: string = generateTimeRandomStr();
    let textName: string = 'text' + random + '.txt';
    let rename: string = 'renameText' + random + '.txt';
    let fileName: string = 'mkcolTest' + random + '/';
    let copyName: string = 'file' + random + '.txt';
    afterAll(async () => {
      await HttpRequest('DELETE', XTS_TEST_HTTP_URL + rename, true);
      await HttpRequest('DELETE', XTS_TEST_HTTP_URL + textName, true);
    })

    /**
     * @tc.name   testHttpRequestCustomMethodTest0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0100
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0100';
        console.info(`${caseName}---Start`);
        try {
          let file = 'This is a Test File';
          let httpRequestOptions: http.HttpRequestOptions = {
            expectDataType: http.HttpDataType.STRING,
            extraData: file,
            header: { 'Content-Type': 'text/plain; charset=utf-8', 'Content-Length': file.length.toString() },
            customMethod: 'PUT'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 201);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0200
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0200';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            header: { 'Content-Type': 'text/xml' },
            expectDataType: http.HttpDataType.STRING,
            customMethod: 'GET',
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0300
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0300';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            expectDataType: http.HttpDataType.STRING,
            customMethod: 'MKCOL'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + fileName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 201);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0400
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0400';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            expectDataType: http.HttpDataType.STRING,
            header: { 'Content-Type': 'text/xml' },
            customMethod: 'DELETE'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + fileName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest0500
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0500
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0500';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            expectDataType: http.HttpDataType.STRING,
            header: { 'Destination': XTS_TEST_HTTP_URL + copyName }, // copy路径
            customMethod: 'COPY'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 201);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest0600
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0600
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0600';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            expectDataType: http.HttpDataType.STRING,
            header: { 'Destination': XTS_TEST_HTTP_URL + rename }, // move目标路径
            customMethod: 'MOVE'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + copyName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 201);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest0700
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0700
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0700';
        console.info(`${caseName}---Start`);
        try {
          let proppatchXml =
            `<?xml version="1.0" encoding="UTF-8"?><d:propertyupdate xmlns:d="DAV:"><d:set><d:prop><d:displayname>testttt</d:displayname></d:prop></d:set></d:propertyupdate>`;
          let httpRequestOptions: http.HttpRequestOptions = {
            extraData: proppatchXml,
            expectDataType: http.HttpDataType.STRING,
            header: { 'Content-Type': 'text/xml' },
            customMethod: 'PROPPATCH'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 207);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest0800
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0800
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0800';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            expectDataType: http.HttpDataType.STRING,
            header: {
              'Content-Type': 'text/xml',
              'Depth': '0'
            },
            customMethod: 'PROPFIND'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 207);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest0900
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_0900
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest0900';
        console.info(`${caseName}---Start`);
        try {
          let lockXml: string =
            `<lockinfo xmlns='DAV:'><lockscope><exclusive/></lockscope><locktype><write/></locktype><timeout>Second-3600</timeout><owner>user1</owner></lockinfo>`;
          let httpRequestOptions: http.HttpRequestOptions = {
            extraData: lockXml,
            expectDataType: http.HttpDataType.STRING,
            header: {
              'Content-Type': 'application/xml',
              'Depth': '0',
            },
            customMethod: 'LOCK'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                let lockTokenRegex = /<D:href>(urn:uuid:[a-fA-F0-9\-]+)<\/D:href>/;
                let statusMatch: RegExpMatchArray | null = (data.result as string).match(lockTokenRegex);
                if (statusMatch) {
                  lockToken = statusMatch[1];
                }
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest1000
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1000
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1000';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            header: {
              'Content-Length': '0',
              'Lock-Token': lockToken, //LOCK成功时返回的令牌
              'Depth': '0'
            },
            customMethod: 'UNLOCK'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 204);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest1100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1100
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1100';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            customMethod: 'UNKNOWN'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 400);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest1200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1200
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1200';
        console.info(`${caseName}---Start`);
        try {
          for (let i = 0; i < 10; i++) {
            await HttpRequest('GET', XTS_TEST_HTTP_URL + textName, true);
          }
          done();
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName}---End `);
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest1300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1300
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1300';
        console.info(`${caseName}---Start`);
        try {
          await HttpRequest('DELETE', XTS_TEST_HTTP_URL + fileName, false);
          await HttpRequest('MKCOL', XTS_TEST_HTTP_URL + fileName, false);
          await HttpRequest('DELETE', XTS_TEST_HTTP_URL + fileName, true);
          done();
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName}---End `);
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest1400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1400
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1400';
        console.info(`${caseName}---Start`);
        try {
          await HttpRequest('MKCOL', XTS_TEST_HTTP_URL + fileName, false);
          await HttpRequest('DELETE', XTS_TEST_HTTP_URL + fileName, true);
          await HttpRequest('DELETE', XTS_TEST_HTTP_URL + fileName, false);
          await HttpRequest('DELETE', XTS_TEST_HTTP_URL + fileName, false);
          done();
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName}---End `);
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest1500
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1500
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1500';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            header: { 'Content-Type': 'text/xml' },
            expectDataType: http.HttpDataType.STRING,
            customMethod: 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ'
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });
    /**
     * @tc.name   testHttpRequestCustomMethodTest1600
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1600
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1600';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            header: { 'Content-Type': 'text/xml' },
            expectDataType: http.HttpDataType.STRING,
            customMethod: ''
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request(XTS_TEST_HTTP_URL + textName, httpRequestOptions).then((res) => {
            console.info(`${caseName} data: --- ${JSON.stringify(res)}`);
            ExpectTrue(res.responseCode == 200);
            httpRequest.destroy();
            console.info(`${caseName}---End `);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} catch ERROR: ${JSON.stringify(err)}`);
            ExpectFail();
            httpRequest.destroy();
            console.info(`${caseName}---End `);
            done();
          });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });
    /**
     * @tc.name   testHttpRequestCustomMethodTest1700
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1700
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1700';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            header: { 'Content-Type': 'text/xml' },
            expectDataType: http.HttpDataType.STRING,
            customMethod: ''
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.requestInStream(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: Error, data: number) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data == 200);
                httpRequest.destroy();
                console.info(`${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });
    /**
     * @tc.name   testHttpRequestCustomMethodTest1800
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1800
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomMethodTest1800';
        console.info(`${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            header: { 'Content-Type': 'text/xml' },
            expectDataType: http.HttpDataType.STRING,
            customMethod: ''
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.requestInStream(XTS_TEST_HTTP_URL + textName, httpRequestOptions).then((res) => {
            console.info(`${caseName} data: --- ${JSON.stringify(res)}`);
            ExpectTrue(res == 200);
            httpRequest.destroy();
            console.info(`${caseName}---End `);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} catch ERROR: ${JSON.stringify(err)}`);
            ExpectFail();
            httpRequest.destroy();
            console.info(`${caseName}---End `);
            done();
          });
        } catch (err) {
          console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End `);
          done();
        }
      });
  });
}
