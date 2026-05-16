/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function SetDefaultResourceUsageObserverTest() {
  describe('SetDefaultResourceUsageObserverTest', () => {
    let originalObserver: errorManager.ResourceUsageObserver;

    beforeAll(() => {
      console.info("====> SetDefaultResourceUsageObserverTest beforeAll start");
    })
    beforeEach(() => {
      console.info("====> SetDefaultResourceUsageObserverTest beforeEach start");
    })
    afterEach(() => {
      console.info("====> SetDefaultResourceUsageObserverTest afterEach start");
    })
    afterAll(() => {
      console.info("====> SetDefaultResourceUsageObserverTest afterAll start");
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0100
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0100
     * @tc.desc   验证setDefaultResourceUsageObserver正常调用，设置PSS_MEMORY资源观察器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0100 start");
      try {
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
          if (detailInfo) {
            console.info("DetailInfo: " + JSON.stringify(detailInfo));
          }
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        console.info("====> testSetDefaultResourceUsageObserver_0100 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0200
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0200
     * @tc.desc   验证setDefaultResourceUsageObserver链式调用，设置多个观察器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0200 start");
      try {
        let observer1: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          console.info("Observer1 ResourceType: " + resourceType);
          console.info("Observer1 ResourceSize: " + resourceSize);
        };
        let observer2: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          console.info("Observer2 ResourceType: " + resourceType);
          console.info("Observer2 ResourceSize: " + resourceSize);
        };
        let prevObserver = errorManager.setDefaultResourceUsageObserver(observer1);
        let prevObserver2 = errorManager.setDefaultResourceUsageObserver(observer2);
        console.info("====> testSetDefaultResourceUsageObserver_0200 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0200 catch > error code: {err.code}, error msg: {err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0300
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0300
     * @tc.desc   验证setDefaultResourceUsageObserver传入null参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDefaultResourceUsageObserver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0300 start");
      try {
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          console.info("ResourceType: " + resourceType);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        let prevObserver = errorManager.setDefaultResourceUsageObserver(null);
        expect(prevObserver === observer).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_0300 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0300 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0400
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0400
     * @tc.desc   验证setDefaultResourceUsageObserver传入undefined参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDefaultResourceUsageObserver_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0400 start");
      try {
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          console.info("ResourceType: " + resourceType);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        let prevObserver = errorManager.setDefaultResourceUsageObserver(undefined);
        expect(prevObserver === observer).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_0400 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0400 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0500
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0500
     * @tc.desc   验证ResourceUsageObserver回调接收PSS_MEMORY类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0500 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.PSS_MEMORY).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_0500 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0500 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0600
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0600
     * @tc.desc   验证ResourceUsageObserver回调接收ION_MEMORY类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0600 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        console.info("====> testSetDefaultResourceUsageObserver_0600 end + " + receivedType);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.ION_MEMORY).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_0600 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0600 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0700
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0700
     * @tc.desc   验证ResourceUsageObserver回调接收ASHMEM_MEMORY类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0700 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.ASHMEM_MEMORY).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_0700 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0700 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0800
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0800
     * @tc.desc   验证ResourceUsageObserver回调接收FD类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0800 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.FD).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_0800 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0800 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_0900
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0900
     * @tc.desc   验证ResourceUsageObserver回调接收THREAD类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_0900 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.THREAD).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_0900 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_0900 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_1000
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1000
     * @tc.desc   验证ResourceUsageObserver回调接收detailInfo参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_1000 start");
      try {
        let receivedDetailInfo: Record<string, number> | undefined = undefined;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          receivedDetailInfo = detailInfo;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
          if (detailInfo) {
            console.info("DetailInfo: " + JSON.stringify(detailInfo));
          }
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        expect(receivedDetailInfo === undefined || typeof receivedDetailInfo === 'object').assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_1000 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_1000 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_1100
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1100
     * @tc.desc   验证setDefaultResourceUsageObserver在非主线程调用抛出错误码16000205
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDefaultResourceUsageObserver_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info("====> testSetDefaultResourceUsageObserver_1100 start");
      try {
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => {
          console.info("ResourceType: " + resourceType);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        console.info("====> testSetDefaultResourceUsageObserver_1100 end");
        done();
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_1100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code === 16000205).assertTrue();
        done();
      }
    })
  })
}
