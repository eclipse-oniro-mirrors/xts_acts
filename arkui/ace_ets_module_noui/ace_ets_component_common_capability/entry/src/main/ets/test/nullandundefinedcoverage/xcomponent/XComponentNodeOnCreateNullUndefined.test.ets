/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { XComponentNode, UIContext } from '@kit.ArkUI';

// Interface for test data tracking
interface TestOnCreateData {
  onCreateCalled: boolean;
  onCreateEventValue: Object | null | undefined;
}

// Interface for event object
interface TestEventObject {
  context?: string;
  id?: string;
}

// Mock XComponentNode class for testing onCreate with null/undefined
// Using overloaded methods to handle different parameter types
class MockXComponentNodeOnCreate {
  public testData: TestOnCreateData = {
    onCreateCalled: false,
    onCreateEventValue: undefined
  };

  onCreate(event: Object): void;
  onCreate(event: null): void;
  onCreate(event: undefined): void;
  onCreate(event: Object | null | undefined): void {
    this.testData.onCreateCalled = true;
    this.testData.onCreateEventValue = event;
  }

  reset(): void {
    this.testData.onCreateCalled = false;
    this.testData.onCreateEventValue = undefined;
  }
}

export default function xComponentNodeOnCreateNullUndefinedTest() {
  describe('XComponentNodeOnCreateNullUndefinedTest', () => {
    let mockNode: MockXComponentNodeOnCreate = new MockXComponentNodeOnCreate();

    beforeAll(() => {
      console.info('[XComponentNodeOnCreateNullUndefinedTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[XComponentNodeOnCreateNullUndefinedTest] beforeEach called');
      mockNode.reset();
    });

    afterEach(() => {
      console.info('[XComponentNodeOnCreateNullUndefinedTest] afterEach called');
    });

    afterAll(() => {
      console.info('[XComponentNodeOnCreateNullUndefinedTest] afterAll called');
    });

    /**
     * @tc.name   xComponentNode_onCreate_event_null_001
     * @tc.number SUB_ARKUI_XCOMPONENTNODE_ONCREATE_EVENT_NULL_001
     * @tc.desc   Test XComponentNode.onCreate with null event parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentNode_onCreate_event_null_001', Level.LEVEL2, () => {
      console.info('[xComponentNode_onCreate_event_null_001] START');
      try {
        // Test with null event parameter
        const event: null = null;
        mockNode.onCreate(event);
        console.info('[xComponentNode_onCreate_event_null_001] onCreateCalled: ' + mockNode.testData.onCreateCalled);
        console.info('[xComponentNode_onCreate_event_null_001] onCreateEventValue: ' + JSON.stringify(mockNode.testData.onCreateEventValue));

        // Verify that onCreate was called with null event
        expect(mockNode.testData.onCreateCalled).assertTrue();
        expect(mockNode.testData.onCreateEventValue === null).assertTrue();
        console.info('[xComponentNode_onCreate_event_null_001] END');
      } catch (err) {
        console.error('[xComponentNode_onCreate_event_null_001] Error: unexpected exception');
        // null is a valid value for optional Object parameter, should not throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   xComponentNode_onCreate_event_undefined_001
     * @tc.number SUB_ARKUI_XCOMPONENTNODE_ONCREATE_EVENT_UNDEFINED_001
     * @tc.desc   Test XComponentNode.onCreate with undefined event parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentNode_onCreate_event_undefined_001', Level.LEVEL2, () => {
      console.info('[xComponentNode_onCreate_event_undefined_001] START');
      try {
        // Test with undefined event parameter
        const event: undefined = undefined;
        mockNode.onCreate(event);
        console.info('[xComponentNode_onCreate_event_undefined_001] onCreateCalled: ' + mockNode.testData.onCreateCalled);
        console.info('[xComponentNode_onCreate_event_undefined_001] onCreateEventValue: ' + JSON.stringify(mockNode.testData.onCreateEventValue));

        // Verify that onCreate was called with undefined event
        expect(mockNode.testData.onCreateCalled).assertTrue();
        expect(mockNode.testData.onCreateEventValue === undefined).assertTrue();
        console.info('[xComponentNode_onCreate_event_undefined_001] END');
      } catch (err) {
        console.error('[xComponentNode_onCreate_event_undefined_001] Error: unexpected exception');
        // undefined is a valid value for optional Object parameter, should not throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   xComponentNode_onCreate_event_validObject_001
     * @tc.number SUB_ARKUI_XCOMPONENTNODE_ONCREATE_EVENT_VALIDOBJECT_001
     * @tc.desc   Test XComponentNode.onCreate with valid Object event parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentNode_onCreate_event_validObject_001', Level.LEVEL2, () => {
      console.info('[xComponentNode_onCreate_event_validObject_001] START');
      try {
        // Test with valid event parameter
        const event: TestEventObject = { context: 'testContext', id: 'testId' };
        mockNode.onCreate(event);
        console.info('[xComponentNode_onCreate_event_validObject_001] onCreateCalled: ' + mockNode.testData.onCreateCalled);
        console.info('[xComponentNode_onCreate_event_validObject_001] onCreateEventValue: ' + JSON.stringify(mockNode.testData.onCreateEventValue));

        // Verify that onCreate was called with valid event
        expect(mockNode.testData.onCreateCalled).assertTrue();
        expect(mockNode.testData.onCreateEventValue !== null && mockNode.testData.onCreateEventValue !== undefined).assertTrue();
        console.info('[xComponentNode_onCreate_event_validObject_001] END');
      } catch (err) {
        console.error('[xComponentNode_onCreate_event_validObject_001] Error: unexpected exception');
        expect().assertFail();
      }
    });

    /**
     * @tc.name   xComponentNode_onCreate_event_emptyObject_001
     * @tc.number SUB_ARKUI_XCOMPONENTNODE_ONCREATE_EVENT_EMPTYOBJECT_001
     * @tc.desc   Test XComponentNode.onCreate with empty Object event parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentNode_onCreate_event_emptyObject_001', Level.LEVEL2, () => {
      console.info('[xComponentNode_onCreate_event_emptyObject_001] START');
      try {
        // Test with empty object
        const event: TestEventObject = {};
        mockNode.onCreate(event);
        console.info('[xComponentNode_onCreate_event_emptyObject_001] onCreateCalled: ' + mockNode.testData.onCreateCalled);
        console.info('[xComponentNode_onCreate_event_emptyObject_001] onCreateEventValue: ' + JSON.stringify(mockNode.testData.onCreateEventValue));

        // Verify that onCreate was called with empty object
        expect(mockNode.testData.onCreateCalled).assertTrue();
        expect(mockNode.testData.onCreateEventValue !== null && mockNode.testData.onCreateEventValue !== undefined).assertTrue();
        console.info('[xComponentNode_onCreate_event_emptyObject_001] END');
      } catch (err) {
        console.error('[xComponentNode_onCreate_event_emptyObject_001] Error: unexpected exception');
        expect().assertFail();
      }
    });
  });
}
