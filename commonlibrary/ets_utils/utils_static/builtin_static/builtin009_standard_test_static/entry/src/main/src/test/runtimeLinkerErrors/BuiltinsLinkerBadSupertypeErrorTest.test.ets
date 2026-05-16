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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsLinkerBadSupertypeErrorTest() {
  describe('builtinsLinkerBadSupertypeErrorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0001
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0001
     * @tc.desc    Test constructor with no arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerBadSupertypeError();
      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0002
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0002
     * @tc.desc    Test constructor with simple bad supertype message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerBadSupertypeError('Invalid supertype relationship detected');
      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual('Invalid supertype relationship detected');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0003
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0003
     * @tc.desc    Test constructor with empty message string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerBadSupertypeError('');
      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0004
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0004
     * @tc.desc    Test constructor with message containing special characters and type names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialMsg = 'Type "Employee" cannot extend final class "Person<Final>"';
      const error = new LinkerBadSupertypeError(specialMsg);
      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual(specialMsg);
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0005
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0005
     * @tc.desc    Test constructor with options (cause) parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cause = new Error('Type resolution inconsistency found');
      const error = new LinkerBadSupertypeError('Bad supertype error', { cause });
      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual('Bad supertype error');
      expect(error.cause).assertEqual(cause);
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0006
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0006
     * @tc.desc    Test constructor with both message and empty options
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerBadSupertypeError('Invalid inheritance hierarchy detected', {});
      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual('Invalid inheritance hierarchy detected');
      expect(error.cause).assertUndefined();
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0007
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0007
     * @tc.desc    Test constructor with long inheritance error description
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longMsg = 'Invalid supertype relationship: ' +
        'class SpecializedEmployee cannot extend both Manager and Contractor ' +
        'due to conflicting method signatures in the inheritance chain';
      const error = new LinkerBadSupertypeError(longMsg);
      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual(longMsg);
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0008
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0008
     * @tc.desc    Test that error instance is throwable and catchable
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        throw new LinkerBadSupertypeError('Bad supertype test error');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerBadSupertypeError).assertTrue();
        expect(error.name).assertEqual('LinkerBadSupertypeError');
        expect(error.message).assertEqual('Bad supertype test error');
      }
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0009
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0009
     * @tc.desc    Test error stack trace property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerBadSupertypeError('Invalid supertype in linking phase');
      expect(typeof error.stack).assertEqual('string');
      expect(error.stack?.includes('LinkerBadSupertypeError')).assertTrue();
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0010
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0010
     * @tc.desc    Test error with nested cause chain for inheritance errors
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const rootCause = new Error('Initial type hierarchy analysis failed');
      const middleError = new LinkerBadSupertypeError('Intermediate supertype error', { cause: rootCause });
      const topError = new LinkerBadSupertypeError('Final inheritance resolution failed', { cause: middleError });

      expect(topError.cause).assertEqual(middleError);
      expect(middleError.cause).assertEqual(rootCause);
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0011
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0011
     * @tc.desc    Test error with specific class names in supertype error message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const subclass = 'Circle';
      const superclass = 'Rectangle';
      const error = new LinkerBadSupertypeError(
        `Class ${subclass} cannot extend ${superclass} due to incompatible type constraints`
      );

      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertContain(subclass);
      expect(error.message).assertContain(superclass);
      expect(error.message).assertContain('cannot extend');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0012
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0012
     * @tc.desc    Test error toString() method for supertype errors
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerBadSupertypeError('Class Employee cannot extend final class Person');
      const errorString = error.toString();

      expect(errorString).assertContain('LinkerBadSupertypeError');
      expect(errorString).assertContain('Class Employee cannot extend final class Person');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0013
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0013
     * @tc.desc    Test error with final class inheritance violation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const finalClassMsg = 'Cannot extend final class String';
      const error = new LinkerBadSupertypeError(finalClassMsg);

      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual(finalClassMsg);
      expect(error.message).assertContain('final class');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0014
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0014
     * @tc.desc    Test error with cyclic inheritance detection
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cyclicMsg = 'Cyclic inheritance: ClassA extends ClassB, ClassB extends ClassA';
      const error = new LinkerBadSupertypeError(cyclicMsg);

      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertContain('ClassA');
      expect(error.message).assertContain('ClassB');
      expect(error.message).assertContain('Cyclic inheritance');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0015
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0015
     * @tc.desc    Test error with access modifier violation in inheritance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const accessMsg = 'Cannot reduce visibility: public method in superclass cannot be overridden as private';
      const error = new LinkerBadSupertypeError(accessMsg);

      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual(accessMsg);
      expect(error.message).assertContain('reduce visibility');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0016
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0016
     * @tc.desc    Test error with generic type constraint violation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const genericMsg = 'Generic constraint violation: List<T> cannot extend Collection<String> when T is not String';
      const error = new LinkerBadSupertypeError(genericMsg);

      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual(genericMsg);
      expect(error.message).assertContain('Generic constraint');
      expect(error.message).assertContain('List<T>');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0017
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0017
     * @tc.desc    Test error with multiple inheritance violation (for non-multiple inheritance languages)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const multiMsg = 'Multiple inheritance not supported: Class cannot extend both Vehicle and Asset';
      const error = new LinkerBadSupertypeError(multiMsg);

      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual(multiMsg);
      expect(error.message).assertContain('Multiple inheritance');
      expect(error.message).assertContain('Vehicle');
      expect(error.message).assertContain('Asset');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0018
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0018
     * @tc.desc    Test error with covariant/contravariant type mismatch
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const varianceMsg = 'Contravariant type mismatch: Function<Animal> cannot be supertype of Function<Cat>';
      const error = new LinkerBadSupertypeError(varianceMsg);

      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual(varianceMsg);
      expect(error.message).assertContain('Contravariant');
      expect(error.message).assertContain('Function<Animal>');
    });

    /**
     * @tc.name    builtinsLinkerBadSupertypeErrorTest0019
     * @tc.number  BUILTINS_LINKER_BAD_SUPERTYPE_ERROR_TEST_0019
     * @tc.desc    Test error with primitive type inheritance attempt
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerBadSupertypeErrorTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const primitiveMsg = 'Cannot extend primitive type int';
      const error = new LinkerBadSupertypeError(primitiveMsg);

      expect(error.name).assertEqual('LinkerBadSupertypeError');
      expect(error.message).assertEqual(primitiveMsg);
      expect(error.message).assertContain('primitive type');
    });

  })
}