/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let exclusionStr = "10.136.15.254,www.baidu.com";
let exclusionArray = exclusionStr.split(',');

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionTest() {

  describe("ConnectionTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0100
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0100
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: "admin",
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +':succeeded data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0200
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0200
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: "",
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });


    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0400
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0400
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          password: '123456',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host );
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0500
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0500
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          password: '',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done()
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });


    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0800
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0800
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0800';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: '',
          password: '',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host );
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done()
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0900
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0900
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0900';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: 'admin',
          password: '123456',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
            ExpectTrue(data?.host == httpProxy.host);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

  })
}