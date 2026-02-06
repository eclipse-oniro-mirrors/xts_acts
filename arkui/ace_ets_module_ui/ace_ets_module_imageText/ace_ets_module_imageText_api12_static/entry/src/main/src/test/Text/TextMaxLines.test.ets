'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextMaxLines() {
  describe('TextMaxLines', () => {
    beforeAll(() => {
      console.info("TextMaxLines beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextMaxLines beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextMaxLines",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextMaxLines state pages:" + JSON.stringify(pages));
        if (!("TextMaxLines" == pages.name)) {
          console.info("get TextMaxLines pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextMaxLines page error:" + err);
      }
      console.info("TextMaxLines beforeEach end");
    }); 


    
    /**
     * @tc.number   TextMaxLines_static_0010
     * @tc.name     TextMaxLines_static_0010
     * @tc.desc     TextMaxLines_static_0010
     * @tc.level   Level.LEVEL0
     */
    it('TextMaxLines_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextMaxLines_0010 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('maxLines')).assertEqual('4');
      console.info('TextMaxLines_0010 END');
      done();
    });


    /**
     * @tc.number   TextLineHeight_static_0020
     * @tc.name     TextLineHeight_static_0020
     * @tc.desc     TextLineHeight_static_0020
     * @tc.level   Level.LEVEL0
     */
    it('TextLineHeight_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextLineHeight_0020 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('lineHeight')).assertEqual('10.00fp');
      console.info('TextLineHeight_0020 END');
      done();
    });


    /**
     * @tc.number   TextBaselineOffset_static_0030
     * @tc.name     TextBaselineOffset_static_0030
     * @tc.desc     TextBaselineOffset_static_0030
     * @tc.level   Level.LEVEL0
     */
    it('TextBaselineOffset_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextBaselineOffset_0030 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('baselineOffset')).assertEqual('10');
      console.info('TextBaselineOffset_0030 END');
      done();
    });


    /**
     * @tc.number   TextFontStyle_static_0040
     * @tc.name     TextFontStyle_static_0040
     * @tc.desc     TextFontStyle_static_0040
     * @tc.level   Level.LEVEL0
     */
    it('TextFontStyle_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextFontStyle_0040 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      console.info('TextFontStyle_0040 END');
      done();
    });

    
    /**
     * @tc.number   TextLetterSpacing_static_0050
     * @tc.name     TextLetterSpacing_static_0050
     * @tc.desc     TextLetterSpacing_static_0050
     * @tc.level   Level.LEVEL0
     */
    it('TextLetterSpacing_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextLetterSpacing_0050 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('letterSpacing')).assertEqual('5.00fp');
      console.info('TextLetterSpacing_0050 END');
      done();
    });

    
    /**
     * @tc.number   TextTextAlign_static_0060
     * @tc.name     TextTextAlign_static_0060
     * @tc.desc     TextTextAlign_static_0060
     * @tc.level   Level.LEVEL0
     */
    it('TextTextAlign_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTextAlign_0060 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
      console.info('TextTextAlign_0060 END');
      done();
    });

    
    /**
     * @tc.number   TextConstraintSize_static_0070
     * @tc.name     TextConstraintSize_static_0070
     * @tc.desc     TextConstraintSize_static_0070
     * @tc.level   Level.LEVEL0
     */
    it('TextConstraintSize_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextConstraintSize_0070 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('constraintSize')).getString('minWidth')).assertEqual('100.00vp');
      console.info('TextConstraintSize_0070 END');
      done();
    });


    /**
     * @tc.number   TextConstraintSize_static_0080
     * @tc.name     TextConstraintSize_static_0080
     * @tc.desc     TextConstraintSize_static_0080
     * @tc.level   Level.LEVEL0
     */
    it('TextConstraintSize_static_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextConstraintSize_0080 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('constraintSize')).getString('maxWidth')).assertEqual('200.00vp');
      console.info('TextConstraintSize_0080 END');
      done();
    });


    /**
     * @tc.number   TextConstraintSize_static_0090
     * @tc.name     TextConstraintSize_static_0090
     * @tc.desc     TextConstraintSize_static_0090
     * @tc.level   Level.LEVEL0
     */
    it('TextConstraintSize_static_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextConstraintSize_0090 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('constraintSize')).getString('minHeight')).assertEqual('100.00vp');
      console.info('TextConstraintSize_0090 END');
      done();
    });
  })
}