/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import {
  DownloadIconStyle,
  DownloadDescription,
  DownloadLayoutDirection
} from '@ohos.arkui.advanced.DownloadFileButton';
import {
  FontStyle,
  FontWeight
} from '@ohos.arkui.component';

let want: Want;
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const LOG_CHUNK_SIZE = 500;

function logLongString(tag: string, longStr: string): void {
  let len = longStr.length;
  let part = 1;
  for (let i = 0; i < len; i += LOG_CHUNK_SIZE) {
    let end = i + LOG_CHUNK_SIZE;
    if (end > len) {
      end = len;
    }
    console.info(`${tag} [${part}] ${longStr.substring(i, end)}`);
    part++;
  }
}

export default function DownloadFileButtonTest(): void {
  describe('DownloadFileButtonTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('DownloadFileButtonTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.dialog.download.static', 'EntryAbility');

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DownloadFileButton/DownloadFileButtonIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DownloadFileButtonTest state pages: ' + JSON.stringify(pages));
        console.info('DownloadFileButtonTest state pages.name: ' + pages.name);
        if (pages.name !== 'DownloadFileButtonIndex') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('DownloadFileButtonTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    beforeEach(async (): Promise<void> => {
      console.info('DownloadFileButtonTest beforeEach start');
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number DownloadFileButtonTest_001
     * @tc.name DownloadFileButtonGetNode
     * @tc.desc Test DownloadIconStyle FULL_FILLED enum value, verify download button displays filled style icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DownloadFileButtonGetNode', Level.LEVEL1, async (done: () => void) => {
      console.info('DownloadFileButtonTest: DownloadFileButtonGetNode begin');
      let driver = Driver.create();
      let buttonComponent = await driver.findComponent(ON.id('downloadFileButtonFullFilled'));
      if(buttonComponent !== undefined){
        console.info('DownloadFileButtonTest: push DownloadFileButtonIndex page success');
      } else {
        console.info('DownloadFileButtonTest: push DownloadFileButtonIndex page failed');
      }
      let node = JSON.parseJsonElement(inspector.getInspectorByKey('downloadFileButtonFullFilled'));
      logLongString('DownloadFileButtonTest: node =', JSON.stringifyJsonElement(node));
      expect(node != null).assertTrue();
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_002
     * @tc.name downloadIconStyleFullFilled
     * @tc.desc Test DownloadIconStyle FULL_FILLED enum value, verify FULL_FILLED=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadIconStyleFullFilled', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadIconStyleFullFilled begin');
      expect(DownloadIconStyle.FULL_FILLED).assertEqual(1);
      console.info('DownloadFileButtonTest: downloadIconStyleFullFilled end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_003
     * @tc.name downloadIconStyleLines
     * @tc.desc Test DownloadIconStyle LINES enum value, verify LINES=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadIconStyleLines', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadIconStyleLines begin');
      expect(DownloadIconStyle.LINES).assertEqual(2);
      console.info('DownloadFileButtonTest: downloadIconStyleLines end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_004
     * @tc.name downloadDescriptionDownload
     * @tc.desc Test DownloadDescription DOWNLOAD enum value, verify DOWNLOAD=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadDescriptionDownload', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadDescriptionDownload begin');
      expect(DownloadDescription.DOWNLOAD).assertEqual(1);
      console.info('DownloadFileButtonTest: downloadDescriptionDownload end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_005
     * @tc.name downloadDescriptionDownloadFile
     * @tc.desc Test DownloadDescription DOWNLOAD_FILE enum value, verify DOWNLOAD_FILE=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadDescriptionDownloadFile', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadDescriptionDownloadFile begin');
      expect(DownloadDescription.DOWNLOAD_FILE).assertEqual(2);
      console.info('DownloadFileButtonTest: downloadDescriptionDownloadFile end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_006
     * @tc.name downloadDescriptionSave
     * @tc.desc Test DownloadDescription SAVE enum value, verify SAVE=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadDescriptionSave', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadDescriptionSave begin');
      expect(DownloadDescription.SAVE).assertEqual(3);
      console.info('DownloadFileButtonTest: downloadDescriptionSave end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_007
     * @tc.name downloadDescriptionSaveImage
     * @tc.desc Test DownloadDescription SAVE_IMAGE enum value, verify SAVE_IMAGE=4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadDescriptionSaveImage', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadDescriptionSaveImage begin');
      expect(DownloadDescription.SAVE_IMAGE).assertEqual(4);
      console.info('DownloadFileButtonTest: downloadDescriptionSaveImage end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_008
     * @tc.name downloadDescriptionSaveFile
     * @tc.desc Test DownloadDescription SAVE_FILE enum value, verify SAVE_FILE=5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadDescriptionSaveFile', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadDescriptionSaveFile begin');
      expect(DownloadDescription.SAVE_FILE).assertEqual(5);
      console.info('DownloadFileButtonTest: downloadDescriptionSaveFile end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_009
     * @tc.name downloadDescriptionDownloadAndShare
     * @tc.desc Test DownloadDescription DOWNLOAD_AND_SHARE enum value, verify DOWNLOAD_AND_SHARE=6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadDescriptionDownloadAndShare', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadDescriptionDownloadAndShare begin');
      expect(DownloadDescription.DOWNLOAD_AND_SHARE).assertEqual(6);
      console.info('DownloadFileButtonTest: downloadDescriptionDownloadAndShare end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_010
     * @tc.name downloadDescriptionReceive
     * @tc.desc Test DownloadDescription RECEIVE enum value, verify RECEIVE=7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadDescriptionReceive', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadDescriptionReceive begin');
      expect(DownloadDescription.RECEIVE).assertEqual(7);
      console.info('DownloadFileButtonTest: downloadDescriptionReceive end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_011
     * @tc.name downloadDescriptionContinueToReceive
     * @tc.desc Test DownloadDescription CONTINUE_TO_RECEIVE enum value, verify CONTINUE_TO_RECEIVE=8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadDescriptionContinueToReceive', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadDescriptionContinueToReceive begin');
      expect(DownloadDescription.CONTINUE_TO_RECEIVE).assertEqual(8);
      console.info('DownloadFileButtonTest: downloadDescriptionContinueToReceive end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_012
     * @tc.name downloadLayoutDirectionHorizontal
     * @tc.desc Test DownloadLayoutDirection HORIZONTAL enum value, verify HORIZONTAL=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadLayoutDirectionHorizontal', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadLayoutDirectionHorizontal begin');
      expect(DownloadLayoutDirection.HORIZONTAL).assertEqual(0);
      console.info('DownloadFileButtonTest: downloadLayoutDirectionHorizontal end');
      done();
    });

    /**
     * @tc.number DownloadFileButtonTest_013
     * @tc.name downloadLayoutDirectionVertical
     * @tc.desc Test DownloadLayoutDirection VERTICAL enum value, verify VERTICAL=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('downloadLayoutDirectionVertical', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: downloadLayoutDirectionVertical begin');
      expect(DownloadLayoutDirection.VERTICAL).assertEqual(1);
      console.info('DownloadFileButtonTest: downloadLayoutDirectionVertical end');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DOWNLOADFILEBUTTON_FONTSTYLENORMAL_0100
     * @tc.name SUB_ARKUI_DOWNLOADFILEBUTTON_FONTSTYLENORMAL_0100
     * @tc.desc Test FontStyle Normal enum value, verify Normal=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DOWNLOADFILEBUTTON_FONTSTYLENORMAL_0100', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: fontStyleNormal begin');
      expect(FontStyle.Normal).assertEqual(0);
      console.info('DownloadFileButtonTest: fontStyleNormal end');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DOWNLOADFILEBUTTON_FONTWEIGHTNORMAL_0200
     * @tc.name SUB_ARKUI_DOWNLOADFILEBUTTON_FONTWEIGHTNORMAL_0200
     * @tc.desc Test FontWeight Medium enum value, verify Medium=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DOWNLOADFILEBUTTON_FONTWEIGHTNORMAL_0200', Level.LEVEL1, (done: () => void) => {
      console.info('DownloadFileButtonTest: fontWeightMedium begin');
      expect(FontWeight.Medium).assertEqual(3);
      console.info('DownloadFileButtonTest: fontWeightMedium end');
      done();
    });
  });
}
