/**
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

/**
 * RichEditor DataDetector DATE_TIME 属性测试用例
 *
 * 测试目标: 验证RichEditor组件的TextDataDetectorType.DATE_TIME属性功能
 * 测试覆盖:
 * 1. enableDataDetector属性设置为true，dataDetectorConfig.types设置为[TextDataDetectorType.DATE_TIME]
 *
 * 重要说明：
 * - enableDataDetector需要设置为true才能启用数据检测
 * - dataDetectorConfig.types设置为[TextDataDetectorType.DATE_TIME]时，只识别日期时间类型的实体
 * - TextDataDetectorType.DATE_TIME的值为4，表示识别日期时间实体
 * - RichEditor需要通过RichEditorController和onReady回调来添加文本内容
 */

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function RichEditorDataDetectorDateTimeTest() {
  describe('RichEditorDataDetectorDateTimeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorDataDetectorDateTimeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorDataDetectorDateTime',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorDataDetectorDateTimeTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorDataDetectorDateTime" == pages.name)) {
          console.info("get RichEditorDataDetectorDateTimeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorDataDetectorDateTimeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorDataDetectorDateTimeTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   richEditorDataDetectorDateTime_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DATADETECTOR_DATETIME_PARAM_0100
     * @tc.desc   Test RichEditor enableDataDetector with true and dataDetectorConfig.types with [TextDataDetectorType.DATE_TIME]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDataDetectorDateTime_0100', Level.LEVEL1, async () => {
      console.info('[richEditorDataDetectorDateTime_0100] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('key_richEditor_dataDetector_dateTime');
      console.info('[richEditorDataDetectorDateTime_0100] strJson: ' + strJson);

      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // 验证enableDataDetector属性
      let enableDataDetectorValue: boolean = obj.$attrs.enableDataDetector as boolean;
      console.info('[richEditorDataDetectorDateTime_0100] enableDataDetector: ' + enableDataDetectorValue);

      // 验证dataDetectorConfig配置
      let dataDetectorConfigValue: ESObject = obj.$attrs.dataDetectorConfig as ESObject;
      console.info('[richEditorDataDetectorDateTime_0100] dataDetectorConfig: ' + JSON.stringify(dataDetectorConfigValue));

      // 验证enableDataDetector为true
      expect(enableDataDetectorValue).assertEqual('true');

      // 验证dataDetectorConfig存在且包含types配置
      let hasDataDetectorConfig = dataDetectorConfigValue !== null && dataDetectorConfigValue !== undefined;
      expect(hasDataDetectorConfig).assertTrue();

      console.info('[richEditorDataDetectorDateTime_0100] END');
    });

    /**
     * @tc.name   richEditorDataDetectorDateTime_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_DATADETECTOR_DATETIME_PARAM_0200
     * @tc.desc   Test RichEditor dataDetectorConfig.types contains TextDataDetectorType.DATE_TIME (value: 4)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDataDetectorDateTime_0200', Level.LEVEL1, async () => {
      console.info('[richEditorDataDetectorDateTime_0200] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('key_richEditor_dataDetector_dateTime');
      console.info('[richEditorDataDetectorDateTime_0200] strJson: ' + strJson);

      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // 验证dataDetectorConfig.types配置
      let dataDetectorConfigValue: ESObject = obj.$attrs.dataDetectorConfig as ESObject;
      console.info('[richEditorDataDetectorDateTime_0200] dataDetectorConfig: ' + JSON.stringify(dataDetectorConfigValue));

      // 验证dataDetectorConfig存在
      expect(dataDetectorConfigValue).assertContain('"types":"datetime"');
      console.info('[richEditorDataDetectorDateTime_0200] END');
    });
  })
}
