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

import router from '@ohos.router';

import { Driver, ON, MouseButton } from '@ohos.UiTest';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  LeadingMarginPlaceholder,
  FontWeight,
  TextAlign,
  WordBreak,
  TextOverflow
} from '@ohos.arkui.component';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ParagraphStyle1() {
  describe('ParagraphStyle1', () => {
    beforeAll(() => {
      console.info("ParagraphStyle1 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ParagraphStyle1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphStyle1',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ParagraphStyle1 state pages:" + JSON.stringify(pages));
        if (!("ParagraphStyle1" == pages.name)) {
          console.info("get ParagraphStyle1 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParagraphStyle1 page error: " + err);
      }
      // done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParagraphStyle1 after each called");
    });


    
    
    


/**
     * @tc.number   ParagraphStyle_static_10001
     * @tc.name     ParagraphStyle_static_10001
     * @tc.desc     ParagraphStyle_static_10001
     * @tc.level    Level.LEVEL1
     */
it('ParagraphStyle_static_10001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('StyledString ParagraphStyle_static_10001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('text'))
      await CommonFunc.sleep(500);
      get!.click()
      await CommonFunc.sleep(500);
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_0_textAlign ' +
      AppStorage.get<undefined | TextAlign>('StyledString1_0_textAlign'));
      expect('' + AppStorage.get<undefined | TextAlign>('StyledString1_0_textAlign')).assertEqual('1');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_1_textIndent ' +
      AppStorage.get<undefined | number>('StyledString1_1_textIndent'));
      expect('' + AppStorage.get<undefined | number>('StyledString1_1_textIndent')).assertEqual('15');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_1_maxLines ' +
      AppStorage.get<undefined | number>('StyledString1_1_maxLines'));
      expect('' + AppStorage.get<undefined | number>('StyledString1_1_maxLines')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_1_pixelMap ' +
      AppStorage.get<string>('StyledString1_1_pixelMap'));
      expect('' + AppStorage.get<string>('StyledString1_1_pixelMap')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_1_size ' +
      AppStorage.get<string>('StyledString1_1_size'));
      expect('' + AppStorage.get<string>('StyledString1_1_size')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_2_textAlign ' +
      AppStorage.get<undefined | TextAlign>('StyledString1_2_textAlign'));
      expect('' + AppStorage.get<undefined | TextAlign>('StyledString1_2_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_2_pixelMap ' +
      AppStorage.get<string>('StyledString1_2_pixelMap'));
      const StyledStringPixelMap: string = AppStorage.get<string>('StyledString1_2_pixelMap')!
      const timestamp:double = JSON.parseJsonElement(StyledStringPixelMap).getDouble("timestamp")
      const captureId:double = JSON.parseJsonElement(StyledStringPixelMap).getDouble("captureId")
      expect(timestamp + captureId).assertEqual(0);
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_2_size ' +
      AppStorage.get<string>('StyledString1_2_size'));
      expect('' + AppStorage.get<string>('StyledString1_2_size')).assertEqual('["15.00vp","15.00vp"]');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_3_textAlign ' +
      AppStorage.get<undefined | TextAlign>('StyledString1_3_textAlign'));
      expect('' + AppStorage.get<undefined | TextAlign>('StyledString1_3_textAlign')).assertEqual('2');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_3_maxLines ' +
      AppStorage.get<undefined | int>('StyledString1_3_maxLines'));
      expect('' + AppStorage.get<undefined | int>('StyledString1_3_maxLines')).assertEqual('1');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_3_wordBreak ' +
      AppStorage.get<undefined | WordBreak>('StyledString1_3_wordBreak'));
      expect('' + AppStorage.get<undefined | WordBreak>('StyledString1_3_wordBreak')).assertEqual('1');
      console.info('StyledString ParagraphStyle_static_10001 StyledString1_3_overflow ' +
      AppStorage.get<undefined | TextOverflow>('StyledString1_3_overflow'));
      expect('' + AppStorage.get<undefined | TextOverflow>('StyledString1_3_overflow')).assertEqual('2');
      AppStorage.delete('StyledString1_0_textAlign')
      AppStorage.delete('StyledString1_1_textIndent')
      AppStorage.delete('StyledString1_1_maxLines')
      AppStorage.delete('StyledString1_1_pixelMap')
      AppStorage.delete('StyledString1_1_size')
      AppStorage.delete('StyledString1_2_textAlign')
      AppStorage.delete('StyledString1_2_pixelMap')
      AppStorage.delete('StyledString1_2_size')
      AppStorage.delete('StyledString1_3_textAlign')
      AppStorage.delete('StyledString1_3_maxLines')
      AppStorage.delete('StyledString1_3_wordBreak')
      AppStorage.delete('StyledString1_3_overflow')
      console.info("[ParagraphStyle_static_10001] end");
      done();
    });
  })
}