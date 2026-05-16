/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import fileio from "@ohos.fileio";
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import {
  photoKeys,
  fetchOption,
  getFileAsset, getPermission, driveFn, sleep,
} from '../common'
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';


async function closeCallbackTest (done:Function, testNum:string, fetchOps:ESObject) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset:ESObject = await getFileAsset(testContext, testNum, fetchOps);
    const fd:ESObject = await asset.getReadOnlyFd();
    console.info(`${testNum} fd: ${fd}`);
    asset.close(fd, async (err:BusinessError) => {
      if (err) {
        console.info(`${testNum} err: ${err}`);
        expect(false).assertTrue();
      } else {
        let count = 0;
        let buf = new ArrayBuffer(4096);
        try {
          await fileio.read(fd, buf);
          console.info(`${testNum} read suc`);
        } catch (error) {
          console.info(`${testNum} read fail`);
          count++;
        }
        try {
          await fileio.write(fd, buf);
          console.info(`${testNum} write suc`);
        } catch (error) {
          count++;
          console.info(`${testNum} write fail`);
        }
        console.info(`${testNum} count: ${count}`);
        expect(count).assertEqual(2);
      }
      done();
    })
  } catch (error) {
    console.info(`${testNum} failed; error: ${error}`);
    expect(false).assertTrue();
    done();
  }
}

async function closeErrorCallbackTest (done:Function, testNum:string, fetchOps:ESObject) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset:ESObject = await getFileAsset(testContext, testNum, fetchOps);
    const fd: Array<string> = ['123123'];
    console.info(`${testNum} fd: ${fd}`);
    asset.close(fd, async (err:BusinessError) => {
      expect(false).assertTrue();
    })
    done();
  } catch (error) {
    console.info(`${testNum} failed; error: ${error}`);
    expect(error.code === '13900020' || error.code === '401').assertTrue();
    done();
  }
}

async function closePromiseTest (done:Function, testNum:string, fetchOps:ESObject) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const asset:ESObject = await getFileAsset(testContext, testNum, fetchOps);
    const fd:ESObject = await asset.getReadOnlyFd();
    console.info(`${testNum} fd: ${fd}`);
    await asset.close(fd);
    let count = 0;
    let buf = new ArrayBuffer(4096);
    try {
      await fileio.read(fd, buf);
      console.info(`${testNum} read suc`);
    } catch (error) {
      count++;
      console.info(`${testNum} read fail`);
    }
    try {
      await fileio.write(fd, buf);
      console.info(`${testNum} write suc`);
    } catch (error) {
      count++;
      console.info(`${testNum} write fail`);
    }
    console.info(`${testNum} count: ${count}`);
    expect(count).assertEqual(2);
    done();
  } catch (error) {
    console.info(`${testNum} failed; error: ${error}`);
    expect(false).assertTrue();
    done();
  }
}

async function closeErrorPromiseTest (done:Function, testNum:string, fetchOps:ESObject) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset:ESObject = await getFileAsset(testContext, testNum, fetchOps);
    const fd: Array<string> = ['123123'];
    console.info(`${testNum} fd: ${fd}`);
    await asset.close(fd);
    expect(false).assertTrue();
    done();
  } catch (error) {
    console.info(`${testNum} failed; error: ${error}`);
    expect(error.code === '13900020' || error.code === '401').assertTrue();
    done();
  }
}


export default function closeTest () {
  describe('closeTest', ()=>{

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   photoAsset_close_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_CALLBACK_0000
     * @tc.desc   image asset close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('photoAsset_close_callback_000', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'photoAsset_close_callback_000';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await closeCallbackTest(done, testNum, fetchOps);
    });

    /**
     * @tc.name   photoAsset_close_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_CALLBACK_0100
     * @tc.desc   video asset close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('photoAsset_close_callback_001', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'photoAsset_close_callback_001';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await closeCallbackTest(done, testNum, fetchOps);
    });

    /**
     * @tc.name   photoAsset_close_callback_002
     * @tc.number SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_CALLBACK_0200
     * @tc.desc   video asset close, fd is array<string>, error code 13900020 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_close_callback_002', Level.LEVEL2, async (done:Function)=> {
      const testNum = 'photoAsset_close_callback_002';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await closeErrorCallbackTest(done, testNum, fetchOps);
    });

    /**
     * @tc.name   photoAsset_close_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_PROMISE_0000
     * @tc.desc   image asset close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('photoAsset_close_promise_000', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'photoAsset_close_promise_000';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await closePromiseTest(done, testNum, fetchOps);
    });

    /**
     * @tc.name   photoAsset_close_promise_001
     * @tc.number SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_PROMISE_0100
     * @tc.desc   video asset close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('photoAsset_close_promise_001', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'photoAsset_close_promise_001';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await closePromiseTest(done, testNum, fetchOps);
    });

    /**
     * @tc.name   photoAsset_close_promise_002
     * @tc.number SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_PROMISE_0200
     * @tc.desc   video asset close, fd is array<string>, error code 13900020 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_close_promise_002', Level.LEVEL2, async (done:Function)=> {
      const testNum = 'photoAsset_close_promise_002';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await closeErrorPromiseTest(done, testNum, fetchOps);
    });
  })
}
