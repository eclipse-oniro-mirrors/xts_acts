/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// ================= 注解定义 =================

@Target([AnnotationTargets.CLASS])
@interface ClassAnno {}

@Target([AnnotationTargets.ENUMERATION])
@interface EnumAnno {}

@Target([AnnotationTargets.FUNCTION])
@interface FuncAnno {}

@Target([AnnotationTargets.CLASS_FIELD])
@interface FieldAnno {}

@Target([AnnotationTargets.CLASS_METHOD])
@interface MethodAnno {}

@Target([AnnotationTargets.PARAMETER])
@interface ParamAnno {}

// TYPE 位置必须 SOURCE
@Retention("SOURCE")
@Target([AnnotationTargets.TYPE])
@interface TypeUseAnno {}

@Target([
  AnnotationTargets.CLASS,
  AnnotationTargets.CLASS_METHOD,
  AnnotationTargets.PARAMETER
])
@interface MultiAnno {}


// ================= 被测代码 =================

@ClassAnno
class MyClass {
  say(): string {
    return "class-ok"
  }
}

@EnumAnno
enum Color {
  RED = 1,
  GREEN = 2
}

@FuncAnno
function topFunction(): string {
  return "function-ok"
}

class Person {
  @FieldAnno
  name: @TypeUseAnno string

  constructor(@ParamAnno name: string) {
    this.name = name
  }

  @MethodAnno
  greet(@ParamAnno msg: string): string {
    return `${msg}, ${this.name}`
  }
}

@MultiAnno
class Multi {
  @MultiAnno
  run(@MultiAnno x: number): number {
    return x * 2
  }
}

export default function AnnotationsTest() {
  describe('AnnotationsTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_ANNOTATIONS_0100
     * @tc.name AnnotationsTest001
     * @tc.desc test NullPointerError when accessing uninitialized class member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AnnotationsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const c = new MyClass()
      expect(c.say()).assertEqual("class-ok")
    });

    /**
     * @tc.number SUB_ANNOTATIONS_0200
     * @tc.name AnnotationsTest002
     * @tc.desc test NullPointerError when accessing uninitialized class member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AnnotationsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Color.RED).assertEqual(1)
    });

    /**
     * @tc.number SUB_ANNOTATIONS_0300
     * @tc.name AnnotationsTest003
     * @tc.desc test function annotation usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AnnotationsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(topFunction()).assertEqual("function-ok")
    });

    /**
     * @tc.number SUB_ANNOTATIONS_0400
     * @tc.name AnnotationsTest004
     * @tc.desc test field and type use annotation usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AnnotationsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const p = new Person("ArkTS")
      expect(p.greet("hello")).assertEqual("hello, ArkTS")
    });

    /**
     * @tc.number SUB_ANNOTATIONS_0500
     * @tc.name AnnotationsTest005
     * @tc.desc test multi-target annotation usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AnnotationsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const m = new Multi()
      expect(m.run(5)).assertEqual(10)
    });

  });
}