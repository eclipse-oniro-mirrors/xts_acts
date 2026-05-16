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

export default function ParagraphStyle2() {
  describe('ParagraphStyle2', () => {
    beforeAll(() => {
      console.info("ParagraphStyle2 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ParagraphStyle2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphStyle2',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ParagraphStyle2 state pages:" + JSON.stringify(pages));
        if (!("ParagraphStyle2" == pages.name)) {
          console.info("get ParagraphStyle2 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParagraphStyle2 page error: " + err);
      }
      // done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParagraphStyle2 after each called");
    });


    
    
    


/**
     * @tc.number   ParagraphStyle_static_20001
     * @tc.name     ParagraphStyle_static_20001
     * @tc.desc     ParagraphStyle_static_20001
     * @tc.level    Level.LEVEL1
     */
it('ParagraphStyle_static_20001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('StyledString ParagraphStyle_static_20001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('text'))
      await CommonFunc.sleep(500);
      get!.click()
      await CommonFunc.sleep(500);
      console.info('StyledString ParagraphStyle10001 StyledString2_textAlign ' +
      AppStorage.get<undefined | TextAlign>('StyledString2_textAlign'));
      expect('' + AppStorage.get<undefined | TextAlign>('StyledString2_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString2_textIndent ' +
      AppStorage.get<undefined | number>('StyledString2_textIndent'));
      expect('' + AppStorage.get<undefined | number>('StyledString2_textIndent')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString2_maxLines ' +
      AppStorage.get<undefined | int>('StyledString2_maxLines'));
      expect('' + AppStorage.get<undefined | int>('StyledString2_maxLines')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString2_wordBreak ' +
      AppStorage.get<undefined | WordBreak>('StyledString2_wordBreak'));
      expect('' + AppStorage.get<undefined | WordBreak>('StyledString2_wordBreak')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString2_leadingMargin ' +
      AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString2_leadingMargin'));
      expect('' + AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString2_leadingMargin'))
        .assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString2_overflow ' +
      AppStorage.get<undefined | TextOverflow>('StyledString2_overflow'));
      expect('' + AppStorage.get<undefined | TextOverflow>('StyledString2_overflow')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString3_textAlign ' +
      AppStorage.get<undefined | TextAlign>('StyledString3_textAlign'));
      expect('' + AppStorage.get<undefined | TextAlign>('StyledString3_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString3_textIndent ' +
      AppStorage.get<undefined | number>('StyledString3_textIndent'));
      expect('' + AppStorage.get<undefined | number>('StyledString3_textIndent')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString3_maxLines ' +
      AppStorage.get<undefined | int>('StyledString3_maxLines'));
      expect('' + AppStorage.get<undefined | int>('StyledString3_maxLines')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString3_wordBreak ' +
      AppStorage.get<undefined | WordBreak>('StyledString3_wordBreak'));
      expect('' + AppStorage.get<undefined | WordBreak>('StyledString3_wordBreak')).assertEqual('2');
      console.info('StyledString ParagraphStyle10001 StyledString3_leadingMargin ' +
      AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString3_leadingMargin'));
      expect('' + AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString3_leadingMargin'))
        .assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString3_overflow ' +
      AppStorage.get<undefined | TextOverflow>('StyledString3_overflow'));
      expect('' + AppStorage.get<undefined | TextOverflow>('StyledString3_overflow')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString4_textAlign ' +
      AppStorage.get<undefined | TextAlign>('StyledString4_textAlign'));
      expect('' + AppStorage.get<undefined | TextAlign>('StyledString4_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString4_textIndent ' +
      AppStorage.get<undefined | number>('StyledString4_textIndent'));
      expect('' + AppStorage.get<undefined | number>('StyledString4_textIndent')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString4_maxLines ' +
      AppStorage.get<undefined | int>('StyledString4_maxLines'));
      expect('' + AppStorage.get<undefined | int>('StyledString4_maxLines')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString4_wordBreak ' +
      AppStorage.get<undefined | WordBreak>('StyledString4_wordBreak'));
      expect('' + AppStorage.get<undefined | WordBreak>('StyledString4_wordBreak')).assertEqual('3');
      console.info('StyledString ParagraphStyle10001 StyledString4_leadingMargin ' +
      AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString4_leadingMargin'));
      expect('' + AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString4_leadingMargin'))
        .assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString4_overflow ' +
      AppStorage.get<undefined | TextOverflow>('StyledString4_overflow'));
      expect('' + AppStorage.get<undefined | TextOverflow>('StyledString4_overflow')).assertEqual('3');
      AppStorage.delete('StyledString2_textAlign')
      AppStorage.delete('StyledString2_textIndent')
      AppStorage.delete('StyledString2_maxLines')
      AppStorage.delete('StyledString2_wordBreak')
      AppStorage.delete('StyledString2_leadingMargin')
      AppStorage.delete('StyledString2_overflow')
      AppStorage.delete('StyledString3_textAlign')
      AppStorage.delete('StyledString3_textIndent')
      AppStorage.delete('StyledString3_maxLines')
      AppStorage.delete('StyledString3_wordBreak')
      AppStorage.delete('StyledString3_leadingMargin')
      AppStorage.delete('StyledString3_overflow')
      AppStorage.delete('StyledString4_textAlign')
      AppStorage.delete('StyledString4_textIndent')
      AppStorage.delete('StyledString4_maxLines')
      AppStorage.delete('StyledString4_wordBreak')
      AppStorage.delete('StyledString4_leadingMargin')
      AppStorage.delete('StyledString4_overflow')
      console.info("[ParagraphStyle_static_20001] end");
      done();
    });
  })
}