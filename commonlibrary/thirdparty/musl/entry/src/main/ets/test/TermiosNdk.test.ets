/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import termios from 'libtermiosndk.so'

export default function termiosNdkTest() {
  describe('MuslTermiosTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_TCDRAIN_0100
    * @tc.name       : testMuslTermiosTcdrain001
    * @tc.desc       : test tcdrain
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslTermiosTcdrain001', 0, async (done: Function) => {
      let c:number = termios.tcdrain(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_TCFLOW_0100
    * @tc.name       : testMuslTermiosTcflow001
    * @tc.desc       : test tcflow
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslTermiosTcflow001', 0, async (done: Function) => {
      let c:number = termios.tcflow(0);
      expect(c).assertEqual(-1);
      done()
    });
    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_TCFLUSH_0100
    * @tc.name       : testMuslTermiosTcflush001
    * @tc.desc       : test tcflush
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslTermiosTcflush001', 0, async (done: Function) => {
      let c:number = termios.tcflush(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_TCGETATTR_0100
    * @tc.name       : testMuslTermiosTcgetattr001
    * @tc.desc       : test tcgetattr
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslTermiosTcgetattr001', 0, async (done: Function) => {
      let c:number = termios.tcgetattr(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_TCGETSID_0100
    * @tc.name       : testMuslTermiosTcgetsid001
    * @tc.desc       : test tcgetsid
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslTermiosTcgetsid001', 0, async (done: Function) => {
      let c:number = termios.tcgetsid(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_TCSENDBREAK_0100
    * @tc.name       : testMuslTermiosTcsendbreak001
    * @tc.desc       : test tcsendbreak
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslTermiosTcsendbreak001', 0, async (done: Function) => {
      let c:number = termios.tcsendbreak(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_SETATTR_0100
    * @tc.name       : testMuslTermiosTcsetattr001
    * @tc.desc       : test tcsetattr
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslTermiosTcsetattr001', 0, async (done: Function) => {
      let c:number = termios.tcsetattr(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_CFSETISPEDD_0100
     * @tc.name       : testMuslTermiosCfsetispeed001
     * @tc.desc       : test cfsetispeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTermiosCfsetispeed001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = termios.cfsetispeed();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_CFSETOSPEDD_0100
     * @tc.name       : testMuslTermiosCfsetospeed001
     * @tc.desc       : test cfsetospeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTermiosCfsetospeed001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = termios.cfsetospeed();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_CFSETSPEDD_0100
     * @tc.name       : testMuslTermiosCfsetspeed001
     * @tc.desc       : test cfsetspeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTermiosCfsetspeed001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = termios.cfsetspeed();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_CFGETISPEDD_0100
     * @tc.name       : testMuslTermiosCfgetispeed001
     * @tc.desc       : test cfgetispeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTermiosCfgetispeed001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = termios.cfgetispeed();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_CFMAKERAW_0100
     * @tc.name       : testMuslTermiosCfmakeraw001
     * @tc.desc       : test cfmakeraw
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTermiosCfmakeraw001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = termios.cfmakeraw();
      expect(result).assertEqual(resultTrue);
      done()
    });
  });
}
