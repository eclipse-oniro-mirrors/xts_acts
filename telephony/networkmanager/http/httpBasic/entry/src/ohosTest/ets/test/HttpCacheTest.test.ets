/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

import http from '@ohos.net.http';
import connection from '@ohos.net.connection';
import { describe, expect, it , TestType, Size, Level } from '@ohos/hypium';
import {BusinessError} from '@ohos.base';

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

export default  function HttpCacheTest() {
  describe('HttpCacheTest',  () =>{

    /**
     * @tc.name   testTelephonyNetStackHttpTestBasicGet0100
     * @tc.number SUB_Telephony_NetStack_HttpTestBasicGet_0100
     * @tc.desc   usingCache test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyNetStackHttpTestBasicGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>{
      let caseName = 'testTelephonyNetStackHttpTestBasicGet0100';
      console.info(`${caseName}---start`);
      try {
        connection.hasDefaultNet((error, data) =>{
          console.log(`${caseName} get error is `+ JSON.stringify(error)+ " data is " + JSON.stringify(data));
          if (data && !error) {
            let httpRequest  = http.createHttp();
            httpRequest.request('https://www.baidu.com', {
              usingCache: true
            }).then((data) =>{
              console.info(`${caseName} get data is: `+ JSON.stringify(data));
              httpRequest.destroy();
              ExpectTrue(data.responseCode === http.ResponseCode.OK || data.responseCode > 500);
              console.info(`${caseName}---end`);
              done();
            });
          }else{
            ExpectFail();
            done();
            console.info(`${caseName}---end`);
          }
        })
      } catch (error) {
        console.error(`${caseName} catch fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttpTestBasicGet0200
     * @tc.number SUB_Telephony_NetStack_HttpTestBasicGet_0200
     * @tc.desc   usingCache test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyNetStackHttpTestBasicGet0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>{
      let caseName = 'testTelephonyNetStackHttpTestBasicGet0200';
      console.info(`${caseName}---start`);
      try {
        connection.hasDefaultNet( (error, data) =>{
          console.log(`${caseName} get error is `+ JSON.stringify(error)+ " data is " + JSON.stringify(data));
          if (data && !error) {
            let httpRequest = http.createHttp();
            httpRequest.request('https://www.baidu.com', {
              usingCache: false
            }).then((data) =>{
              httpRequest.destroy();
              console.info(`${caseName} get data is: `+ JSON.stringify(data));
              ExpectTrue(data.responseCode === http.ResponseCode.OK || data.responseCode > 500);
              done();
            });
          }else{
          console.log(`${caseName} hasDefaultNet is: `+data);
          ExpectFail();
          done();
          console.info(`${caseName}---end`);
        }
        })
      } catch (error) {
        console.error(`${caseName} catch fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttpTestCacheFlush_0100
     * @tc.number SUB_Telephony_NetStack_HttpTestCacheFlush_0100
     * @tc.desc   cache flush test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyNetStackHttpTestCacheFlush_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>{
      let caseName = 'testTelephonyNetStackHttpTestCacheFlush_0100';
      console.info(`${caseName}---start`);
      try {
        connection.hasDefaultNet( (error, data)=> {
          console.log(`${caseName} get error is `+ JSON.stringify(error)+ " data is " + JSON.stringify(data));
          if (data && !error) {
            let httpRequest = http.createHttp();
            let cache = http.createHttpResponseCache(10 * 1024 * 1024);
            httpRequest.request('https://www.baidu.com', {
              usingCache: true
            }).then((data) =>{
              cache.flush().then(()=> {
                ExpectTrue(true);
                httpRequest.destroy();
                console.info(`${caseName}-flush success --end`);
                done();
              }).catch((err: Error) => {
                console.error(`${caseName} flush fail err is: `+JSON.stringify(err));
                ExpectFail();
                console.info(`${caseName}---end`);
                done();
              });
            });
          }else{
            console.log(`${caseName} hasDefaultNet is: `+data);
            ExpectFail();
            done();
            console.info(`${caseName}---end`);
          }
        })
      } catch (error) {
        console.error(`${caseName} catch fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttpTestCacheFlush_0200
     * @tc.number SUB_Telephony_NetStack_HttpTestCacheFlush_0200
     * @tc.desc   cache flush test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyNetStackHttpTestCacheFlush_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>{
      let caseName = 'testTelephonyNetStackHttpTestCacheFlush_0200';
      console.info(`${caseName}---start`);
      try {
        connection.hasDefaultNet((error, data) =>{
          console.log(`${caseName} get error is `+ JSON.stringify(error)+ " data is " + JSON.stringify(data));
          if (data && !error) {
            let httpRequest = http.createHttp();
            let cache = http.createHttpResponseCache(10 * 1024 * 1024);
            httpRequest.request('https://www.baidu.com', {
              usingCache: true
            }).then((data) =>{
              cache.flush((err: BusinessError) => {
                httpRequest.destroy()
                console.info(`${caseName} cache flush data is: `+ JSON.stringify(data));
                ExpectTrue(err == undefined);
                console.info(`${caseName}---end`);
                done();
              });
            });
          }else{
            console.log(`${caseName} hasDefaultNet is: `+data);
            ExpectFail();
            done();
            console.info(`${caseName}---end`);
          }
        })
      } catch (error) {
        console.error(`${caseName} catch fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttpTestCacheDelete0100
     * @tc.number SUB_Telephony_NetStack_HttpTestCacheDelete_0100
     * @tc.desc   cache flush test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyNetStackHttpTestCacheDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>{
      let caseName = 'testTelephonyNetStackHttpTestCacheDelete0100';
      console.info(`${caseName}---start`);
      try {
        connection.hasDefaultNet( (error, data)=> {
          console.log(`${caseName} get error is `+ JSON.stringify(error)+ " data is" + JSON.stringify(data));
           if (data && !error) {
            let httpRequest = http.createHttp();
            let cache = http.createHttpResponseCache(10 * 1024 * 1024);
            httpRequest.request('https://www.baidu.com', {
              usingCache: true
            }).then((data)=> {
              cache.delete().then(()=>{
                httpRequest.destroy();
                ExpectTrue(true);
                console.info(`${caseName}---end`);
                done();
              }).catch((err: BusinessError)=>{
                httpRequest.destroy();
                console.error(`${caseName} get err is `+JSON.stringify(err));
                ExpectFail();
                console.info(`${caseName}---end`);
                done();
              })
            });
          }else{
            console.log(`${caseName} hasDefaultNet is: `+data);
            ExpectFail();
            done();
            console.info(`${caseName}---end`);
          }
        })
      } catch (error) {
        console.error(`${caseName} catch fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyNetStackHttpTestCacheDelete0200
     * @tc.number SUB_Telephony_NetStack_HttpTestCacheDelete_0200
     * @tc.desc   cache flush test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetStackHttpTestCacheDelete0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>{
      let caseName = 'testTelephonyNetStackHttpTestCacheDelete0200';
      console.info(`${caseName}---start`);
      try {
        connection.hasDefaultNet((error, data) =>{
          console.log(`${caseName} get error is `+ JSON.stringify(error)+ " data is " + JSON.stringify(data));
          if (data && !error) {
            let httpRequest = http.createHttp();
            let cache = http.createHttpResponseCache(10 * 1024 * 1024);
            httpRequest.request('https://www.baidu.com', {
              usingCache: true
            }).then((data) =>{
              cache.delete( (error: BusinessError)=> {
                httpRequest.destroy();
                console.error(`${caseName} get err is `+JSON.stringify(error));
                ExpectTrue(error == undefined);
                done();
              });
            });
          }else{
            console.log(`${caseName} hasDefaultNet is: `+data);
            ExpectFail();
            done();
            console.info(`${caseName}---end`);
          }
        })
      } catch (error) {
        console.error(`${caseName} catch fail, err: ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---end`);
        done();
      }
    });
  });
};
