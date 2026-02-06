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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import { pasteboard } from '@kit.BasicServicesKit';
import { fileUri } from '@kit.CoreFileKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let TAG = 'ttt';

export default function PasteboardProgressPermissionTest() {
  describe('PasteboardProgressWithoutPermission', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardProgressPermissionTest_0100
     * @tc.name getDataWithProgress_without_permission_test
     * @tc.desc Test pasteBoard progress single level path and no fileConflictOption
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardProgressPermissionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardProgressPermissionTest_0100 start ************')
      const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const context = delegator.getAppContext().getApplicationContext();
      let filePath: string = context.filesDir + '/src';
      let dstDir = context.distributedFilesDir + '/dst';
      let fileFullName = filePath + '/test1.txt';
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 1
      };
      try {
        await systemPasteboard.getDataWithProgress(params);
        expect().assertFail();
      } catch (err) {
        console.info(TAG + 'Failed to getDataWithProgress.Cause: ' + err.message + ', code: ' + err.code)
        expect(err.code).assertEqual('201')
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardProgressPermissionTest_0100 end ************')
    })
  })
}