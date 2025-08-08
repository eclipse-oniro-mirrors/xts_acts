/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';

let TAG = 'ttt';
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();

export default function PasteboardAppShareOptions() {
  describe('PasteboardAppShareOptions', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
      systemPasteboard.clearDataSync();
      systemPasteboard.removeAppShareOptions();
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0100
     * @tc.name setAppShareOptions001
     * @tc.desc PasteData setAppShareOptions inapp removeAppShareOption.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0100 start ************')
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
        console.info(TAG + 'setAppShareOptions001 setAppShareOptions inApp success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions001 setAppShareOptions inApp fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'setAppShareOptions001 removeAppShareOptions success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions001 removeAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0200
     * @tc.name setAppShareOptions002
     * @tc.desc PasteData setAppShareOptions localDevice removeAppShareOption.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0200 start ************')
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.LOCALDEVICE);
        console.info(TAG + 'setAppShareOptions002 setAppShareOptions localDevice success');
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions002 setAppShareOptions localDevice fail, code:${error.code}, msg:${error.message}`);
        expect(error.code).assertEqual('401');
      }
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'setAppShareOptions002 removeAppShareOptions success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions002 removeAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0300
     * @tc.name setAppShareOptions003
     * @tc.desc PasteData setAppShareOptions localDevice removeAppShareOption.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0300 start ************')
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.CROSSDEVICE);
        console.info(TAG + 'setAppShareOptions003 setAppShareOptions localDevice success');
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions003 setAppShareOptions corssDevice fail, code:${error.code}, msg:${error.message}`);
        expect(error.code).assertEqual('401');
      }
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'setAppShareOptions003 removeAppShareOptions success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions003 removeAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0300 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0400
     * @tc.name setAppShareOptions004
     * @tc.desc PasteData setAppShareOptions param undefined.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0400 start ************')
      try {
        systemPasteboard.setAppShareOptions(undefined);
        console.info(TAG + 'setAppShareOptions004 setAppShareOptions localDevice success');
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions004 setAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect(error.code).assertEqual('401');
      }
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'setAppShareOptions004 removeAppShareOptions success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions004 removeAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0400 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0600
     * @tc.name setAppShareOptions006
     * @tc.desc PasteData setAppShareOptions inApp and crossDevice and remove
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0600 start ************')
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
        console.info(TAG + 'setAppShareOptions006 setAppShareOptions inApp success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions006 setAppShareOptions inApp fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.CROSSDEVICE);
        console.info(TAG + 'setAppShareOptions006 setAppShareOptions crossDevice success')
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions006 removeAppShareOptions crossDevice fail, code:${error.code}, msg:${error.message}`);
        expect(error.code).assertEqual('401')
      }
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'setAppShareOptions006 removeAppShareOptions success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions006 removeAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0600 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0800
     * @tc.name setAppShareOptions008
     * @tc.desc PasteData setAppShareOptions crossDevice and remove setAppShareOptions inApp and remove
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0800 start ************')
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.CROSSDEVICE);
        expect().assertFail();
        console.info(TAG + 'setAppShareOptions008 setAppShareOptions inApp success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions008 setAppShareOptions inApp fail, code:${error.code}, msg:${error.message}`);
        expect(error.code).assertEqual('401');
      }
      systemPasteboard.removeAppShareOptions();
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
        console.info(TAG + 'setAppShareOptions008 setAppShareOptions crossDevice success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions008 removeAppShareOptions crossDevice fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      systemPasteboard.removeAppShareOptions();
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0800 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0900
     * @tc.name setAppShareOptions009
     * @tc.desc PasteData setAppShareOptions localDevice and remove twice
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0900 start ************')
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.LOCALDEVICE);
        expect().assertFail();
        console.info(TAG + 'setAppShareOptions009 setAppShareOptions inApp success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions009 setAppShareOptions inApp fail, code:${error.code}, msg:${error.message}`);
        expect(error.code).assertEqual('401');
      }
      systemPasteboard.removeAppShareOptions();
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'setAppShareOptions006 removeAppShareOptions success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions006 removeAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_0900 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_1000
     * @tc.name setAppShareOptions010
     * @tc.desc PasteData setAppShareOptions inApp twice
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_1000 start ************')
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
        console.info(TAG + 'setAppShareOptions010 setAppShareOptions inApp success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions010 setAppShareOptions inApp fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
        expect().assertFail();
        console.info(TAG + 'setAppShareOptions010 setAppShareOptions inApp success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions010 setAppShareOptions inApp fail, code:${error.code}, msg:${error.message}`);
        expect(error.code).assertEqual('12900006');
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_1000 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_1100
     * @tc.name setAppShareOptions011
     * @tc.desc PasteData removeAppShareOptions twice
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_1100 start ************')
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'setAppShareOptions011 removeAppShareOptions success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions011 removeAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'setAppShareOptions011 removeAppShareOptions success')
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info(TAG + `setAppShareOptions011 removeAppShareOptions fail, code:${error.code}, msg:${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteDataSetAppShareOptions_1100 end ************')
    })
  })
}