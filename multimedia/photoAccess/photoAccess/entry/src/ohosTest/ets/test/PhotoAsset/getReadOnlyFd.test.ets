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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import common from '@ohos.app.ability.common';

async function getReadOnlyFdCallback (done:Function, testNum:string, fetchOps:ESObject) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset:photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
    asset.getReadOnlyFd(async (err, fd) => {
      if (err) {
        console.info(`${testNum} err: ${err}`);
        expect(false).assertTrue();
      } else {
        console.info(`${testNum} fd: ${fd}`);
        try {
          await fileio.write(fd, testNum);
          expect(false).assertTrue();
        } catch (error) {
          console.info(`${testNum} error: ${error}`);
        }
      }
      done();
    })
  } catch (error) {
    console.info(`${testNum} failed; error: ${error}`);
    expect(false).assertTrue();
    done();
  }
}

async function getReadOnlyFdPromise (done:Function, testNum:string, fetchOps:ESObject) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset:photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
    const fd = await asset.getReadOnlyFd();
    console.info(`${testNum} fd: ${fd}`);
    await fileio.write(fd, testNum);
    expect(false).assertTrue();
    done();
  } catch (error) {
    console.info(`${testNum} failed; error: ${error}`);
    done();
  }
}

export default function getReadOnlyFdTest () {
  describe('getReadOnlyFdTest', ()=>{

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_GET_READONLY_FD_CALLBACK_0000
     * @tc.name      : getReadOnlyFd_callback_000
     * @tc.desc      : image asset getReadOnlyFd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReadOnlyFd_callback_000', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getReadOnlyFd_callback_000';
      const fetchOps:photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await getReadOnlyFdCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_GET_READONLY_FD_CALLBACK_0100
     * @tc.name      : getReadOnlyFd_callback_001
     * @tc.desc      : video asset getReadOnlyFd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReadOnlyFd_callback_001', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getReadOnlyFd_callback_001';
      const fetchOps:photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await getReadOnlyFdCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_GET_READONLY_FD_PROMISE_0000
     * @tc.name      : getReadOnlyFd_promise_000
     * @tc.desc      : image asset getReadOnlyFd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReadOnlyFd_promise_000', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getReadOnlyFd_promise_000';
      const fetchOps:photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await getReadOnlyFdPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_GET_READONLY_FD_PROMISE_0100
     * @tc.name      : getReadOnlyFd_promise_001
     * @tc.desc      : video asset getReadOnlyFd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReadOnlyFd_promise_001', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getReadOnlyFd_promise_001';
      const fetchOps:photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await getReadOnlyFdPromise(done, testNum, fetchOps);
    });
  })
}
