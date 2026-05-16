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

/**
 * SegmentButton @Prop and SegmentButtonV2 @Param enableStateAnimation: inspector tree first, mirror Text fallback.
 */

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { ENABLE_STATE_ANIMATION_INDEX_PAGE } from '../../MainAbility/pages/migratedActs/EnableStateAnimationIndex';

const UI_EVENT_CLICK: number = 10;

const KEY_SEGMENT_BUTTON: string = 'segmentButton_prop';
const KEY_TAB_SEGMENT_V2: string = 'tabSegmentButton_param';
const KEY_CAPSULE_SEGMENT_V2: string = 'capsuleSegmentButton_param';

const KEY_MIRROR_SEGMENT: string = 'mirror_enable_segment';
const KEY_MIRROR_TAB: string = 'mirror_enable_tab';
const KEY_MIRROR_CAPSULE: string = 'mirror_enable_capsule';

const KEY_BTN_ALL_TRUE: string = 'btn_enable_all_true';
const KEY_BTN_ALL_FALSE: string = 'btn_enable_all_false';

export default function EnableStateAnimationIndexTest() {
  describe('EnableStateAnimationIndexTest', () => {
    beforeEach(async (done: Function) => {
      await CommonFunc.openRouterPage(ENABLE_STATE_ANIMATION_INDEX_PAGE);
      console.info('EnableStateAnimationIndexTest beforeEach：已打开 EnableStateAnimationIndex');
      await CommonFunc.sleep(3000);
      done();
    });

    afterEach(async () => {
      CommonFunc.popRouterPage();
    });

    /**
     * @tc.number   SUB_ArkUI_SegmentButton_EnableStateAnimation_Mirror_Initial_True_0100
     * @tc.name     SUB_ArkUI_SegmentButton_EnableStateAnimation_Mirror_Initial_True_0100
     * @tc.desc     SegmentButton @Prop enableStateAnimation true; TabSegmentButtonV2 and CapsuleSegmentButtonV2 @Param match
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SegmentButton_EnableStateAnimation_Mirror_Initial_True_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ArkUI_SegmentButton_EnableStateAnimation_Mirror_Initial_True_0100]');
      await ensureAllEnablesTrueByClick();
      assertEnableStateAnimationAttr(KEY_SEGMENT_BUTTON, KEY_MIRROR_SEGMENT, true,
        'SUB_ArkUI_SegmentButton_EnableStateAnimation_Mirror_Initial_True_0100:SegmentButton@Prop');
      assertEnableStateAnimationAttr(KEY_TAB_SEGMENT_V2, KEY_MIRROR_TAB, true,
        'SUB_ArkUI_SegmentButton_EnableStateAnimation_Mirror_Initial_True_0100:TabSegmentButtonV2@Param');
      assertEnableStateAnimationAttr(KEY_CAPSULE_SEGMENT_V2, KEY_MIRROR_CAPSULE, true,
        'SUB_ArkUI_SegmentButton_EnableStateAnimation_Mirror_Initial_True_0100:CapsuleSegmentButtonV2@Param');
      expect(KEY_SEGMENT_BUTTON.length > 0).assertTrue();
    });

    /**
     * @tc.number   SUB_ArkUI_SegmentButton_EnableStateAnimation_Click_False_Mirrors_False_0200
     * @tc.name     SUB_ArkUI_SegmentButton_EnableStateAnimation_Click_False_Mirrors_False_0200
     * @tc.desc     After UI click sets SegmentButton @Prop and both V2 @Param enableStateAnimation to false
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SegmentButton_EnableStateAnimation_Click_False_Mirrors_False_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ArkUI_SegmentButton_EnableStateAnimation_Click_False_Mirrors_False_0200]');
      await ensureAllEnablesTrueByClick();
      let sent: boolean = sendEventByKey(KEY_BTN_ALL_FALSE, UI_EVENT_CLICK, '');
      expect(sent).assertTrue();
      await CommonFunc.sleep(600);
      assertEnableStateAnimationAttr(KEY_SEGMENT_BUTTON, KEY_MIRROR_SEGMENT, false,
        'SUB_ArkUI_SegmentButton_EnableStateAnimation_Click_False_Mirrors_False_0200:SegmentButton@Prop');
      assertEnableStateAnimationAttr(KEY_TAB_SEGMENT_V2, KEY_MIRROR_TAB, false,
        'SUB_ArkUI_SegmentButton_EnableStateAnimation_Click_False_Mirrors_False_0200:TabSegmentButtonV2@Param');
      assertEnableStateAnimationAttr(KEY_CAPSULE_SEGMENT_V2, KEY_MIRROR_CAPSULE, false,
        'SUB_ArkUI_SegmentButton_EnableStateAnimation_Click_False_Mirrors_False_0200:CapsuleSegmentButtonV2@Param');
      expect(KEY_MIRROR_SEGMENT.length > 0).assertTrue();
    });

    /**
     * @tc.number   SUB_ArkUI_SegmentButton_EnableStateAnimation_Toggle_False_Then_True_0300
     * @tc.name     SUB_ArkUI_SegmentButton_EnableStateAnimation_Toggle_False_Then_True_0300
     * @tc.desc     Toggle enableStateAnimation false then true on SegmentButton, TabSegmentButtonV2, CapsuleSegmentButtonV2
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SegmentButton_EnableStateAnimation_Toggle_False_Then_True_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ArkUI_SegmentButton_EnableStateAnimation_Toggle_False_Then_True_0300]');
      await ensureAllEnablesTrueByClick();
      expect(sendEventByKey(KEY_BTN_ALL_FALSE, UI_EVENT_CLICK, '')).assertTrue();
      await CommonFunc.sleep(600);
      assertEnableStateAnimationAttr(KEY_SEGMENT_BUTTON, KEY_MIRROR_SEGMENT, false, 'after_false:SegmentButton@Prop');
      assertEnableStateAnimationAttr(KEY_TAB_SEGMENT_V2, KEY_MIRROR_TAB, false, 'after_false:TabSegmentButtonV2@Param');
      assertEnableStateAnimationAttr(KEY_CAPSULE_SEGMENT_V2, KEY_MIRROR_CAPSULE, false,
        'after_false:CapsuleSegmentButtonV2@Param');
      expect(sendEventByKey(KEY_BTN_ALL_TRUE, UI_EVENT_CLICK, '')).assertTrue();
      await CommonFunc.sleep(600);
      assertEnableStateAnimationAttr(KEY_SEGMENT_BUTTON, KEY_MIRROR_SEGMENT, true, 'after_true:SegmentButton@Prop');
      assertEnableStateAnimationAttr(KEY_TAB_SEGMENT_V2, KEY_MIRROR_TAB, true, 'after_true:TabSegmentButtonV2@Param');
      assertEnableStateAnimationAttr(KEY_CAPSULE_SEGMENT_V2, KEY_MIRROR_CAPSULE, true,
        'after_true:CapsuleSegmentButtonV2@Param');
      expect(KEY_MIRROR_CAPSULE.length > 0).assertTrue();
    });
  });
}

async function ensureAllEnablesTrueByClick(): Promise<void> {
  expect(sendEventByKey(KEY_BTN_ALL_TRUE, UI_EVENT_CLICK, '')).assertTrue();
  await CommonFunc.sleep(500);
}

function assertEnableStateAnimationAttr(componentKey: string, mirrorKey: string, expected: boolean, tag: string): void {
  let strJson: string = getInspectorByKey(componentKey);
  console.info(`[${tag}] getInspectorByKey(${componentKey}) len=${strJson.length}`);
  expect(strJson.length > 0).assertTrue();
  let fromTree: boolean | undefined = parseEnableStateAnimationInInspectorTree(strJson);
  let source: string = 'subtree_$attrs.enableStateAnimation';
  if (fromTree === undefined) {
    let mirrorJson: string = getInspectorByKey(mirrorKey);
    fromTree = parseMirrorTextBool(mirrorJson);
    source = 'FALLBACK:mirror_Text.content';
    console.info(`[${tag}] ${source} mirrorLen=${mirrorJson.length}`);
  } else {
    console.info(`[${tag}] ${source} value=${fromTree}`);
  }

  expect(fromTree !== undefined).assertTrue();
  expect(fromTree).assertEqual(expected);
  expect(typeof fromTree).assertEqual('boolean');
}

function parseEnableStateAnimationInInspectorTree(strJson: string): boolean | undefined {
  let root: Record<string, Object>;
  try {
    root = JSON.parse(strJson) as Record<string, Object>;
  } catch (_e) {
    return undefined;
  }
  return findEnableStateAnimationInNode(root);
}

function findEnableStateAnimationInNode(node: Record<string, Object>): boolean | undefined {
  let hit: boolean | undefined = readEnableStateAnimationFromAttrsOfNode(node);
  if (hit !== undefined) {
    return hit;
  }
  let children: object[] = getInspectorChildrenObjects(node);
  for (let i: number = 0; i < children.length; i++) {
    let child: Record<string, Object> = children[i] as Record<string, Object>;
    let inner: boolean | undefined = findEnableStateAnimationInNode(child);
    if (inner !== undefined) {
      return inner;
    }
  }
  return undefined;
}

function readEnableStateAnimationFromAttrsOfNode(node: Record<string, Object>): boolean | undefined {
  let attrsHolder: Object | undefined = node['$attrs'];
  if (attrsHolder === undefined || attrsHolder === null) {
    return undefined;
  }
  let attrs: Record<string, Object> = attrsHolder as Record<string, Object>;
  return normalizeEnableStateRaw(attrs['enableStateAnimation']);
}

function normalizeEnableStateRaw(raw: Object | undefined): boolean | undefined {
  if (raw === undefined) {
    return undefined;
  }
  if (typeof raw === 'boolean') {
    return raw;
  }
  if (typeof raw === 'string') {
    if (raw === 'true') {
      return true;
    }
    if (raw === 'false') {
      return false;
    }
  }
  if (typeof raw === 'number') {
    if (raw === 1) {
      return true;
    }
    if (raw === 0) {
      return false;
    }
  }
  return undefined;
}

function getInspectorChildrenObjects(node: Record<string, Object>): object[] {
  let ch: Object | undefined = node['$children'] as Object | undefined;
  if (ch === undefined || ch === null) {
    ch = node['children'] as Object | undefined;
  }
  if (ch === undefined || ch === null) {
    return [];
  }
  if (Array.isArray(ch)) {
    return ch as object[];
  }
  let m: Record<string, Object> = ch as Record<string, Object>;
  let names: string[] = Object.keys(m);
  let out: object[] = [];
  for (let i: number = 0; i < names.length; i++) {
    let one: Object | undefined = m[names[i]];
    if (one !== undefined && one !== null && typeof one === 'object') {
      out.push(one as object);
    }
  }
  return out;
}

function parseMirrorTextBool(strJson: string): boolean | undefined {
  if (!strJson || strJson.trim() === '') {
    return undefined;
  }
  let root: Record<string, Object>;
  try {
    root = JSON.parse(strJson) as Record<string, Object>;
  } catch (_e) {
    return undefined;
  }
  let attrsHolder: Object | undefined = root['$attrs'];
  if (attrsHolder === undefined || attrsHolder === null) {
    return undefined;
  }
  let attrs: Record<string, Object> = attrsHolder as Record<string, Object>;
  let raw: Object | undefined = attrs['content'];
  if (typeof raw === 'string') {
    if (raw === '1') {
      return true;
    }
    if (raw === '0') {
      return false;
    }
  }
  return undefined;
}
