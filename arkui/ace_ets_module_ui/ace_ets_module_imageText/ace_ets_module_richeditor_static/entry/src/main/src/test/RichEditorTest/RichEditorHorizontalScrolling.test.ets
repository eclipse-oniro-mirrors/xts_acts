'use static';

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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function RichEditorHorizontalScrollingTest() {

  describe('RichEditorHorizontalScrollingTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RichEditorHorizontalScrollingTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('RichEditorHorizontalScrollingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorHorizontalScrolling',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('RichEditorHorizontalScrollingTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'RichEditorHorizontalScrolling') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('RichEditorHorizontalScrollingTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    /**
 	 * @tc.name   richEditorHorizontalScrolling_true_static_0100
 	 * @tc.number SUB_ARKUI_RICHEDITOR_HORIZONTALSCROLLING_TRUE_STATIC_0100
 	 * @tc.desc   Test RichEditor horizontalScrolling property with true parameter
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('richEditorHorizontalScrolling_true_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[richEditorHorizontalScrolling_true_static_0100] START');
 	  let strJson = inspector.getInspectorByKey('richEditor_horizontalScrolling_true_static');
 	  console.info('[horizontalScrolling] =' + JSON.parseJsonElement(strJson).getElement('$attrs')
	  .getString('horizontalScrolling'));
 	  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('horizontalScrolling'))
	  .assertEqual('true');
 	  console.info('[richEditorHorizontalScrolling_true_static_0100] END');
	  done();
 	})
 	 
 	/**
 	 * @tc.name   richEditorHorizontalScrolling_false_static_0100
 	 * @tc.number SUB_ARKUI_RICHEDITOR_HORIZONTALSCROLLING_FALSE_STATIC_0100
 	 * @tc.desc   Test RichEditor horizontalScrolling property with false parameter
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('richEditorHorizontalScrolling_false_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[richEditorHorizontalScrolling_false_static_0100] START');
 	  let strJson = inspector.getInspectorByKey('richEditor_horizontalScrolling_false_static');
 	  console.info('[horizontalScrolling] =' + JSON.parseJsonElement(strJson).getElement('$attrs')
	  .getString('horizontalScrolling'));
 	  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('horizontalScrolling'))
	  .assertEqual('false');
 	  console.info('[richEditorHorizontalScrolling_false_static_0100] END');
	  done();
 	})
 	/**
 	 * @tc.name   richEditorHorizontalScrolling_undefined_static_0100
 	 * @tc.number SUB_ARKUI_RICHEDITOR_HORIZONTALSCROLLING_UNDEFINED_STATIC_0100
 	 * @tc.desc   Test RichEditor horizontalScrolling property with undefined, should restore to default value
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('richEditorHorizontalScrolling_undefined_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[richEditorHorizontalScrolling_undefined_0100] START');
      let strJson1 = inspector.getInspectorByKey('richEditor_horizontalScrolling_undefined_static');
 	  console.info('[horizontalScrolling] undefined =' + JSON.parseJsonElement(strJson1).getElement('$attrs')
	  .getString('horizontalScrolling'));
      let strJson2 = inspector.getInspectorByKey('richEditor_horizontalScrolling_undefined_static');
 	  console.info('[horizontalScrolling] default =' + JSON.parseJsonElement(strJson2).getElement('$attrs')
	  .getString('horizontalScrolling'));
 	  expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('horizontalScrolling'))
	  .assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('horizontalScrolling'));
 	  console.info('[richEditorHorizontalScrolling_undefined_static_0100] END');
	  done();
 	})
  });
}
