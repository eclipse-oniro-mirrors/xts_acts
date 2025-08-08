/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans
}

export default function ConsoleTest() {
  describe('ConsoleTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0100
     * @tc.name       : testLoadNativeModule001
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule("a");
      } catch (e) {
        console.log("flag");
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("a");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0200
     * @tc.name       : testLoadNativeModule002
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule(undefined);
      } catch (e) {
        console.log("flag");
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("The number of parameters received by loadNativeModule is incorrect");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0300
     * @tc.name       : testLoadNativeModule003
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule(null);
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("The number of parameters received by loadNativeModule is incorrect");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0400
     * @tc.name       : testLoadNativeModule004
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testLoadNativeModule004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule("");
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0500
     * @tc.name       : testLoadNativeModule005
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0600
     * @tc.name       : testLoadNativeModule006
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag =
          loadNativeModule("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0700
     * @tc.name       : testLoadNativeModule007
     * @tc.desc       : Test LoadNativeModule with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule("  !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0800
     * @tc.name       : testLoadNativeModule008
     * @tc.desc       : Test LoadNativeModule with bell character.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule("\a 响铃");
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("\a 响铃");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0900
     * @tc.name       : testLoadNativeModule009
     * @tc.desc       : Test LoadNativeModule with backspace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\b 退格');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\b 退格');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1000
     * @tc.name       : testLoadNativeModule010
     * @tc.desc       : Test LoadNativeModule with form feed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\f 换页');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\f 换页');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1100
     * @tc.name       : testLoadNativeModule011
     * @tc.desc       : Test LoadNativeModule with newline.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\n 换行');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\n 换行');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1200
     * @tc.name       : testLoadNativeModule012
     * @tc.desc       : Test LoadNativeModule with carriage return.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\r 回车');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\r 回车');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1300
     * @tc.name       : testLoadNativeModule013
     * @tc.desc       : Test LoadNativeModule with horizontal tab.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\t 水平制表');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\t 水平制表');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1400
     * @tc.name       : testLoadNativeModule014
     * @tc.desc       : Test LoadNativeModule with vertical tab.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\v 垂直制表');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\v 垂直制表');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1500
     * @tc.name       : testLoadNativeModule015
     * @tc.desc       : Test LoadNativeModule with backslash.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\ 反斜杠');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\ 反斜杠');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1600
     * @tc.name       : testLoadNativeModule016
     * @tc.desc       : Test LoadNativeModule with single quote.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule("\' 单引号");
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("\' 单引号");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1700
     * @tc.name       : testLoadNativeModule017
     * @tc.desc       : Test LoadNativeModule with double quote.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\" 双引号');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\" 双引号');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1800
     * @tc.name       : testLoadNativeModule018
     * @tc.desc       : Test LoadNativeModule with question mark.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\? 问号');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\? 问号');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1900
     * @tc.name       : testLoadNativeModule019
     * @tc.desc       : Test LoadNativeModule with null character.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\0 空字符');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\0 空字符');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2000
     * @tc.name       : testLoadNativeModule020
     * @tc.desc       : Test LoadNativeModule with octal number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\d72 八进制任意数字');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\d72 八进制任意数字');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2100
     * @tc.name       : testLoadNativeModule021
     * @tc.desc       : Test LoadNativeModule with hexadecimal number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\x85 十六进制任意数字');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\x85 十六进制任意数字');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2200
     * @tc.name       : testLoadNativeModule022
     * @tc.desc       : Test LoadNativeModule with pointing up emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('👆 \ud83d\udc46');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('👆 \ud83d\udc46');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2300
     * @tc.name       : testLoadNativeModule023
     * @tc.desc       : Test LoadNativeModule with angry face emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('👿 \ud83d\udc7f');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('👿 \ud83d\udc7f');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2400
     * @tc.name       : testLoadNativeModule024
     * @tc.desc       : Test LoadNativeModule with eyes emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('👀 \ud83d\udc40');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('👀 \ud83d\udc40');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2500
     * @tc.name       : testLoadNativeModule025
     * @tc.desc       : Test LoadNativeModule with 100 points emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('💯 \ud83d\udcaf');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('💯 \ud83d\udcaf');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2600
     * @tc.name       : testLoadNativeModule026
     * @tc.desc       : Test LoadNativeModule with Santa Claus emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('🎅 \ud83c\udf85');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🎅 \ud83c\udf85');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2700
     * @tc.name       : testLoadNativeModule027
     * @tc.desc       : Test LoadNativeModule with cat face with wry smile emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('😼 \ud83d\ude3c');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('😼 \ud83d\ude3c');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2800
     * @tc.name       : testLoadNativeModule028
     * @tc.desc       : Test LoadNativeModule with wrench emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('🔧 \ud83d\udd27');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🔧 \ud83d\udd27');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2900
     * @tc.name       : testLoadNativeModule029
     * @tc.desc       : Test LoadNativeModule with haircut emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('💇 \ud83d\udc87');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('💇 \ud83d\udc87');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3000
     * @tc.name       : testLoadNativeModule030
     * @tc.desc       : Test LoadNativeModule with men wrestling emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3100
     * @tc.name       : testLoadNativeModule031
     * @tc.desc       : Test LoadNativeModule with oil drum emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('🛢 \ud83d\udee2');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🛢 \ud83d\udee2');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3200
     * @tc.name       : testLoadNativeModule032
     * @tc.desc       : Test LoadNativeModule with mahjong tile red dragon emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('🀄 \ud83c\udc04');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🀄 \ud83c\udc04');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3300
     * @tc.name       : testLoadNativeModule033
     * @tc.desc       : Test LoadNativeModule with black flag emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('🏴 \ud83c\udff4');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🏴 \ud83c\udff4');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3400
     * @tc.name       : testLoadNativeModule034
     * @tc.desc       : Test LoadNativeModule with custom initialization.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule(init(200));
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3500
     * @tc.name       : testLoadNativeModule035
     * @tc.desc       : Test LoadNativeModule with object string manipulation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let str = "{k1:value1,k2:value2}";
        let result = str.substring(0, str.length - 2)
        let flag = loadNativeModule(result);
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3600
     * @tc.name       : testLoadNativeModule036
     * @tc.desc       : Test LoadNativeModule with \ud83c.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\ud83c');
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3700
     * @tc.name       : testLoadNativeModule037
     * @tc.desc       : Test LoadNativeModule with \u200d\u2642.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let flag = loadNativeModule('\u200d\u2642');
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3800
     * @tc.name       : testConsole038
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.debug('count: %d', number);
        console.debug('count: %d');
        console.debug(number.toString());
        console.debug('count: %d', str);
        console.debug('count: %d');
        console.debug(str);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3900
     * @tc.name       : testConsole039
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.log('count: %d', number);
        console.log('count: %d');
        console.log(number.toString());
        console.log('count: %d', str);
        console.log('count: %d');
        console.log(str);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4000
     * @tc.name       : testConsole040
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.info('count: %d', number);
        console.info('count: %d');
        console.info(number.toString());
        console.info('count: %d', str);
        console.info('count: %d');
        console.info(str);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4100
     * @tc.name       : testConsole041
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.warn('count: %d', number);
        console.warn('count: %d');
        console.warn(number.toString());
        console.warn('count: %d', str);
        console.warn('count: %d');
        console.warn(str);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4200
     * @tc.name       : testConsole042
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.error('count: %d', number);
        console.error('count: %d');
        console.error(number.toString());
        console.error('count: %d', str);
        console.error('count: %d');
        console.error(str);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4300
     * @tc.name       : testConsole043
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.assert('count: %d', number);
        console.assert('count: %d');
        console.assert(number.toString());
        console.assert('count: %d', str);
        console.assert('count: %d');
        console.assert(str);
        console.assert();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4400
     * @tc.name       : testConsole044
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.count(number.toString());
        console.count(str);
        console.count('count: %d');
        console.count();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4500
     * @tc.name       : testConsole045
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.countReset(number.toString());
        console.countReset(str);
        console.countReset('count: %d');
        console.countReset();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4600
     * @tc.name       : testConsole046
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.dir(number.toString());
        console.dir(str);
        console.dir('count: %d');
        console.dir();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4700
     * @tc.name       : testConsole047
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.dir(number.toString());
        console.dir(str);
        console.dir('count: %d');
        console.dir();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4700
     * @tc.name       : testConsole048
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.group(number);
        console.group(str);
        console.group('count: %d');
        console.group();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4900
     * @tc.name       : testConsole049
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.groupCollapsed(number, str);
        console.groupCollapsed(str);
        console.groupCollapsed('count: %d');
        console.groupCollapsed();
        console.groupCollapsed(number, str, "sdsf");
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5000
     * @tc.name       : testConsole050
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        console.groupEnd();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5100
     * @tc.name       : testConsole051
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.table(number);
        console.table(str);
        console.table('count: %d');
        console.table();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5200
     * @tc.name       : testConsole052
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.time(number.toString());
        console.time(str);
        console.time('count: %d');
        console.time();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5300
     * @tc.name       : testConsole053
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.dirxml(number.toString());
        console.dirxml(str);
        console.dirxml('count: %d');
        console.dirxml();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5300
     * @tc.name       : testConsole053
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.timeEnd(number.toString());
        console.timeEnd(str);
        console.timeEnd('count: %d');
        console.timeEnd();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5500
     * @tc.name       : testConsole055
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.timeLog(number.toString());
        console.timeLog(str);
        console.timeLog('count: %d');
        console.timeLog();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5600
     * @tc.name       : testConsole056
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number = 1;
        let str = "str";
        console.trace(number.toString());
        console.trace(str);
        console.trace('count: %d');
        console.trace();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5700
     * @tc.name       : testConsole057
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        console.traceHybridStack();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5800
     * @tc.name       : testConsole058
     * @tc.desc       : Test Console.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConsole058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        console.log(Math.log2(undefined) + "NaN", "DDGFWDJDGDKDHDJ");
        console.log(Number.isNaN(Math.log2(undefined)) + "NaN", "dasffheggjh")
      } catch (e) {
        expect().assertFail();
      }
    });
  })
}


