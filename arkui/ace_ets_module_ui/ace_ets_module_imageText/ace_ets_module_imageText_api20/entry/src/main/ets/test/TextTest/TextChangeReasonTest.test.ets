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


import { describe, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'

export default function TextChangeReasonTest() {
  describe('TextChangeReasonTest', () => {
    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("TextChangeReasonTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0001
    * @tc.name         TextChangeReasonTest0001
    * @tc.desc         test TextChangeReason UNKNOWN
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0001', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0001 START');
      expect(TextChangeReason.UNKNOWN+'').assertEqual('0');
      console.info("[TextChangeReasonTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0002
    * @tc.name         TextChangeReasonTest0002
    * @tc.desc         test TextChangeReason INPUT
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0002', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0002 START');
      expect(TextChangeReason.INPUT+'').assertEqual('1');
      console.info("[TextChangeReasonTest0002] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0003
    * @tc.name         TextChangeReasonTest0003
    * @tc.desc         test TextChangeReason PASTE
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0003', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0003 START');
      expect(TextChangeReason.PASTE+'').assertEqual('2');
      console.info("[TextChangeReasonTest0003] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0004
    * @tc.name         TextChangeReasonTest0004
    * @tc.desc         test TextChangeReason CUT
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0004', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0004 START');
      expect(TextChangeReason.CUT+'').assertEqual('3');
      console.info("[TextChangeReasonTest0004] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0005
    * @tc.name         TextChangeReasonTest0005
    * @tc.desc         test TextChangeReason DRAG
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0005', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0005 START');
      expect(TextChangeReason.DRAG+'').assertEqual('4');
      console.info("[TextChangeReasonTest0005] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0006
    * @tc.name         TextChangeReasonTest0006
    * @tc.desc         test TextChangeReason AUTO_FILL
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0006', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0006 START');
      expect(TextChangeReason.AUTO_FILL+'').assertEqual('5');
      console.info("[TextChangeReasonTest0006] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0007
    * @tc.name         TextChangeReasonTest0007
    * @tc.desc         test TextChangeReason AI_WRITE
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0007', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0007 START');
      expect(TextChangeReason.AI_WRITE+'').assertEqual('6');
      console.info("[TextChangeReasonTest0007] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0008
    * @tc.name         TextChangeReasonTest0008
    * @tc.desc         test TextChangeReason REDO
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0008', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0008 START');
      expect(TextChangeReason.REDO+'').assertEqual('7');
      console.info("[TextChangeReasonTest0008] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0009
    * @tc.name         TextChangeReasonTest0009
    * @tc.desc         test TextChangeReason UNDO
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0009', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0009 START');
      expect(TextChangeReason.UNDO+'').assertEqual('8');
      console.info("[TextChangeReasonTest0009] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0010
    * @tc.name         TextChangeReasonTest0010
    * @tc.desc         test TextChangeReason CONTROLLER
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0010', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0010 START');
      expect(TextChangeReason.CONTROLLER+'').assertEqual('9');
      console.info("[TextChangeReasonTest0010] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0011
    * @tc.name         TextChangeReasonTest0011
    * @tc.desc         test TextChangeReason ACCESSIBILITY
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0011', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0011 START');
      expect(TextChangeReason.ACCESSIBILITY+'').assertEqual('10');
      console.info("[TextChangeReasonTest0011] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0012
    * @tc.name         TextChangeReasonTest0012
    * @tc.desc         test TextChangeReason COLLABORATION
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0012', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0012 START');
      expect(TextChangeReason.COLLABORATION+'').assertEqual('11');
      console.info("[TextChangeReasonTest0012] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_CHANGE_REASON_ETS_API_0013
    * @tc.name         TextChangeReasonTest0013
    * @tc.desc         test TextChangeReason STYLUS
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextChangeReasonTest0013', Level.LEVEL3, async (done: Function) => {
      console.info('TextChangeReasonTest0013 START');
      expect(TextChangeReason.STYLUS+'').assertEqual('12');
      console.info("[TextChangeReasonTest0013] end");
      done();
    });

  })
}