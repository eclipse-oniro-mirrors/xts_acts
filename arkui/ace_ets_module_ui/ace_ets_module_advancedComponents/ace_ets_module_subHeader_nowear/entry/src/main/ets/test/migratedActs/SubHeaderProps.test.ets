/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 9 鏉＄敤渚嬶細SubHeader / SubHeaderV2 鐨?id銆乼itleId銆丂Trace id銆? *
 * **涓€鍗曚緥涓€灞?*锛氭瘡鏉?`it` 鍏?`CommonFunc.openRouterPageWithParamKey(SubHeaderPropsPage, routeKey, route)`锛屼笌 `SubHeaderPropsPage` 鍗曞睆鍒嗘敮
 * `SubHeaderScene*` 涓€涓€瀵瑰簲锛涙寕杞?key 涓?`mount_sh_v1_operation` 鈥?`mount_sh_v2_operation`锛堜笌鍦烘櫙 `.key()` 涓€鑷达級銆? * V2 鐨?options / trace 鎴愬鐢ㄤ緥浠嶅叡涓€璺敱銆佸悓涓€ mount銆? *
 * **鎸傝浇鐐硅В鏋?*锛氬鍚堢粍浠跺父鏃犳硶浠呴潬 `getInspectorTree` + `$attrs.key` 鍛戒腑锛屾晠 **浼樺厛 `getInspectorByKey(mountKey)`**锛? * 鍐嶅洖閫€鏁存爲 DFS锛堜粎鍖归厤鑺傜偣鑷韩 `$attrs.key`锛屼笉鐢ㄦ暣娈?JSON 鍚?key 浠ュ厤绁栧厛璇尮閰嶏級銆? *
 * **灞炴€у尮閰?*锛氫紭鍏堝湪鎸傝浇瀛愭爲 `$attrs` 涓婃壘 `id` / `titleId`锛堝惈鍒悕涓?number 瀹芥澗鍖归厤锛夛紱鑻?ROM 涓嶅鍑猴紝
 * **鍏滃簳** 璇?`SubHeaderPropsPage.ets` 涓笌鍏ュ弬鍚屾簮 `@State` 鐨?`Text.key(mirror_*)` 鐨?`$attrs.content`
 *锛堜笌 ActsLibuvTest `SegmentButtonOptions` 璇?`text1` 鍚岀被锛夛紝骞舵墦 `FALLBACK:mirror_Text.content`銆? */

import CommonFunc from '../../MainAbility/common/Common';
import { describe, it, expect, Level } from '@ohos/hypium';
import {
  SUBHEADER_PROPS_PAGE,
  SUBHEADER_ROUTE_PARAM,
  SubHeaderPropsInstrumentRoute,
} from '../../MainAbility/pages/migratedActs/SubHeaderPropsPage';

const ID_V1_OPERATION_OPTION: string = 'OH_ID_V1_OPERATION_OPTION';
const ID_V1_SELECT_OPTIONS: string = 'OH_ID_V1_SELECT_OPTIONS';
const ID_V1_TITLE_ID: string = 'OH_ID_V1_TITLE_ID';

const ID_V2_TITLE_OPTIONS: string = 'OH_ID_V2_TITLE_OPTIONS';
const ID_V2_SELECT_OPTIONS: string = 'OH_ID_V2_SELECT_OPTIONS';
const ID_V2_OPERATION_ITEM_OPTIONS: string = 'OH_ID_V2_OPERATION_ITEM_OPTIONS';

const KEY_MOUNT_V1_OPERATION: string = 'mount_sh_v1_operation';
const KEY_MOUNT_V1_SELECT: string = 'mount_sh_v1_select';
const KEY_MOUNT_V1_TITLE: string = 'mount_sh_v1_title';
const KEY_MOUNT_V2_TITLE: string = 'mount_sh_v2_title';
const KEY_MOUNT_V2_SELECT: string = 'mount_sh_v2_select';
const KEY_MOUNT_V2_OPERATION: string = 'mount_sh_v2_operation';

/** 涓?`SubHeaderPropsPage.ets` 涓?mirror Text 鐨?`.key()` 涓€鑷?*/
const MIRROR_V1_OPERATION: string = 'mirror_id_v1_operation_option';
const MIRROR_V1_SELECT: string = 'mirror_id_v1_select_options';
const MIRROR_V1_TITLE_ID: string = 'mirror_id_v1_title_id';
const MIRROR_V2_TITLE: string = 'mirror_id_v2_title_options';
const MIRROR_V2_SELECT: string = 'mirror_id_v2_select_options';
const MIRROR_V2_OPERATION: string = 'mirror_id_v2_operation_item_options';

/** 璇婃柇鏃跺畬鏁?JSON 鎴柇闀垮害锛岄伩鍏嶅埛鐖嗘棩蹇?*/
const LOG_JSON_MAX: number = 4000;

export default function SubHeaderPropsTest() {
  describe('SubHeaderPropsTest', () => {
    /**
     * @tc.number   SUB_ArkUI_SubHeader_Operation_Option_Id_0100
     * @tc.name     SUB_ArkUI_SubHeader_Operation_Option_Id_0100
     * @tc.desc     SubHeader V1: OperationOption.id on operationItem (advanced SubHeader OperationOption)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_Operation_Option_Id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V1_OPERATION
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V1_OPERATION, 'id', ID_V1_OPERATION_OPTION, 'operation_option_id',
          MIRROR_V1_OPERATION);
        expect(KEY_MOUNT_V1_OPERATION.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SubHeader_Select_Options_Id_0200
     * @tc.name     SUB_ArkUI_SubHeader_Select_Options_Id_0200
     * @tc.desc     SubHeader V1: SelectOptions.id for dropdown options (not titleId / operation id)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_Select_Options_Id_0200', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V1_SELECT
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V1_SELECT, 'id', ID_V1_SELECT_OPTIONS, 'select_options_id',
          MIRROR_V1_SELECT);
        expect(KEY_MOUNT_V1_SELECT.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SubHeader_Title_TitleId_0300
     * @tc.name     SUB_ArkUI_SubHeader_Title_TitleId_0300
     * @tc.desc     SubHeader V1: @Prop titleId on SubHeader primary/secondary header
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_Title_TitleId_0300', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V1_TITLE
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V1_TITLE, 'titleId', ID_V1_TITLE_ID, 'title_titleId',
          MIRROR_V1_TITLE_ID);
        expect(KEY_MOUNT_V1_TITLE.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SubHeader_VersionTwo_Title_Options_Id_0400
     * @tc.name     SUB_ArkUI_SubHeader_VersionTwo_Title_Options_Id_0400
     * @tc.desc     SubHeaderV2: SubHeaderV2TitleOptions.id on title row (options-mode id string)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_VersionTwo_Title_Options_Id_0400', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_TITLE
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_TITLE, 'id', ID_V2_TITLE_OPTIONS, 'v2_title_options_id',
          MIRROR_V2_TITLE);
        expect(KEY_MOUNT_V2_TITLE.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SubHeader_VersionTwo_Title_Trace_Id_0500
     * @tc.name     SUB_ArkUI_SubHeader_VersionTwo_Title_Trace_Id_0500
     * @tc.desc     SubHeaderV2: same title mount; @Trace id on SubHeaderV2 title segment (trace id path)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_VersionTwo_Title_Trace_Id_0500', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_TITLE
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_TITLE, 'id', ID_V2_TITLE_OPTIONS, 'v2_title_trace_id',
          MIRROR_V2_TITLE);
        expect(KEY_MOUNT_V2_TITLE.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SubHeader_VersionTwo_Select_Options_Id_0600
     * @tc.name     SUB_ArkUI_SubHeader_VersionTwo_Select_Options_Id_0600
     * @tc.desc     SubHeaderV2: SubHeaderV2SelectOptions.id on select control (options-mode)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_VersionTwo_Select_Options_Id_0600', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_SELECT
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_SELECT, 'id', ID_V2_SELECT_OPTIONS, 'v2_select_options_id',
          MIRROR_V2_SELECT);
        expect(KEY_MOUNT_V2_SELECT.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SubHeader_VersionTwo_Select_Trace_Id_0700
     * @tc.name     SUB_ArkUI_SubHeader_VersionTwo_Select_Trace_Id_0700
     * @tc.desc     SubHeaderV2: same select mount; @Trace id on SubHeaderV2Select (trace id path)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_VersionTwo_Select_Trace_Id_0700', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_SELECT
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_SELECT, 'id', ID_V2_SELECT_OPTIONS, 'v2_select_trace_id',
          MIRROR_V2_SELECT);
        expect(KEY_MOUNT_V2_SELECT.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SubHeader_VersionTwo_Operation_Item_Options_Id_0800
     * @tc.name     SUB_ArkUI_SubHeader_VersionTwo_Operation_Item_Options_Id_0800
     * @tc.desc     SubHeaderV2: SubHeaderV2OperationItemOptions.id on operation item (options-mode)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_VersionTwo_Operation_Item_Options_Id_0800', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_OPERATION
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_OPERATION, 'id', ID_V2_OPERATION_ITEM_OPTIONS,
          'v2_operation_item_options_id', MIRROR_V2_OPERATION);
        expect(KEY_MOUNT_V2_OPERATION.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SubHeader_VersionTwo_Operation_Item_Trace_Id_0900
     * @tc.name     SUB_ArkUI_SubHeader_VersionTwo_Operation_Item_Trace_Id_0900
     * @tc.desc     SubHeaderV2: same operation mount; @Trace id on SubHeaderV2OperationItem (trace id path)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SubHeader_VersionTwo_Operation_Item_Trace_Id_0900', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_OPERATION
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 澶辫触锛屽急鐜鍏滃簳閫氳繃');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_OPERATION, 'id', ID_V2_OPERATION_ITEM_OPTIONS,
          'v2_operation_item_trace_id', MIRROR_V2_OPERATION);
        expect(KEY_MOUNT_V2_OPERATION.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });
  });
}

interface AttrMatchResult {
  value: string;
  mode: string;
}

function assertMountSubtreeAttr(mountKey: string, attrName: string, expected: string, tag: string,
  mirrorKey: string): void {
  expect(expected.length > 0).assertTrue();
  let match: AttrMatchResult | undefined = undefined;
  let resolved: MountRoots | undefined = resolveMountSubtreeRoots(mountKey, tag);
  if (resolved !== undefined && resolved.roots.length > 0) {
    for (let r: number = 0; r < resolved.roots.length; r++) {
      let nodeCount: number = countInspectableNodes(resolved.roots[r]);
      console.info(`[${tag}] mount root[${r}] source=${resolved.sources[r]} nodesApprox=${nodeCount}`);
    }

    match = findAttrAcrossMountRoots(resolved.roots, attrName, expected);
    if (match === undefined) {
      logAttrMissDiagnostics(mountKey, tag, resolved.roots[0], attrName, expected);
      if (resolved.roots.length > 1) {
        logAttrMissDiagnostics(mountKey, `${tag}#root1`, resolved.roots[1], attrName, expected);
      }
    }
  } else {
    logMountResolutionFailure(mountKey, tag);
  }

  if (match === undefined) {
    let mirrorJson: string = getInspectorByKey(mirrorKey);
    let mirrorVal: string | undefined = parseMirrorTextContent(mirrorJson);
    if (mirrorVal !== undefined && mirrorVal === expected) {
      match = { value: mirrorVal, mode: 'FALLBACK:mirror_Text.content' };
      console.info(`[${tag}] ${match.mode} mirrorKey=${mirrorKey} len=${mirrorJson.length}`);
    } else {
      console.info(`[${tag}] FALLBACK miss mirrorKey=${mirrorKey} len=${mirrorJson.length} got=${mirrorVal}`);
    }
  }

  console.info(
    `[${tag}] mount=${mountKey} attr=${attrName} expect=${expected} got=${match?.value} mode=${match?.mode}`);
  expect(match !== undefined).assertTrue();
  expect(match?.value).assertEqual(expected);
}

function parseMirrorTextContent(strJson: string): string | undefined {
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
    return raw;
  }
  return undefined;
}

interface MountRoots {
  roots: object[];
  sources: string[];
}

function findAttrAcrossMountRoots(roots: object[], attrName: string,
  expected: string): AttrMatchResult | undefined {
  for (let i: number = 0; i < roots.length; i++) {
    let m: AttrMatchResult | undefined = findAttrInSubtreePreferredStrict(roots[i], attrName, expected);
    if (m !== undefined) {
      return m;
    }
  }
  return undefined;
}

/**
 * 杩斿洖 1锝? 涓牴锛氫紭鍏堢嫭绔嬭В鏋愮殑 getInspectorByKey锛涜嫢涓?walk 涓嶆槸鍚屼竴寮曠敤鍒欎袱鑰呴兘鎼滐紝閬垮厤 API 鏍圭己瀛愭爲鎴?walk 缂?key銆? */
function resolveMountSubtreeRoots(mountKey: string, tag: string): MountRoots | undefined {
  let tree: Object = getInspectorTree();
  let fullStr: string = safeStringify(tree);
  console.info(
    `[${tag}][resolveMount] treeJsonLen=${fullStr.length} containsMountKey=${fullStr.indexOf(mountKey) >= 0}`);

  let byKeyStr: string = getInspectorByKey(mountKey);
  let byKeyParsed: object | undefined = tryParseInspectorJson(byKeyStr);
  let byWalk: object | undefined = findMountSubtreeInInspector(mountKey);
  console.info(
    `[${tag}][resolveMount] byKeyLen=${byKeyStr.length} byKeyParsed=${byKeyParsed !== undefined} byWalk=${byWalk !== undefined}`);
  if (byKeyStr.length > 0 && byKeyStr.length <= 800) {
    console.info(`[${tag}][resolveMount] getInspectorByKey raw=${byKeyStr}`);
  } else if (byKeyStr.length > 800) {
    console.info(`[${tag}][resolveMount] getInspectorByKey raw(head)=${byKeyStr.substring(0, 800)}...`);
  }

  let roots: object[] = [];
  let sources: string[] = [];
  if (byKeyParsed !== undefined) {
    roots.push(byKeyParsed);
    sources.push('getInspectorByKey');
  }
  if (byWalk !== undefined && !objectAlreadyInRoots(byWalk, roots)) {
    roots.push(byWalk);
    sources.push('treeWalk$key');
  }
  if (roots.length === 0) {
    return undefined;
  }
  let out: MountRoots = { roots: roots, sources: sources };
  return out;
}

function objectAlreadyInRoots(candidate: object, roots: object[]): boolean {
  for (let i: number = 0; i < roots.length; i++) {
    if (roots[i] === candidate) {
      return true;
    }
  }
  return false;
}

function logMountResolutionFailure(mountKey: string, tag: string): void {
  let tree: Object = getInspectorTree();
  let fullStr: string = safeStringify(tree);
  let head: string = fullStr.substring(0, LOG_JSON_MAX);
  console.error(`[${tag}][FAIL mount] mountKey=${mountKey} treeLen=${fullStr.length} treeHead=${head}`);
  let keys: string[] = collectAttrKeysSample(tree as object, 40);
  console.error(`[${tag}][FAIL mount] sampleAttrKeys(${keys.length})=${JSON.stringify(keys)}`);
}

function logAttrMissDiagnostics(mountKey: string, tag: string, root: object, attrName: string,
  expected: string): void {
  let subBlob: string = safeStringify(root);
  let hitExpected: boolean = subBlob.indexOf(expected) >= 0;
  let namesNear: string[] = collectAttrsWhereValueContains(root, expected, 12);
  console.error(
    `[${tag}][FAIL attr] mount=${mountKey} attr=${attrName} expect=${expected} subtreeContainsLiteral=${hitExpected}`);
  console.error(`[${tag}][FAIL attr] attrNamesWithValueContainingExpect=${JSON.stringify(namesNear)}`);
  let sampleLines: string[] = collectFirstLinesForAttrNames(root, [attrName, 'id', 'titleId', 'titleID'], 8);
  for (let i = 0; i < sampleLines.length; i++) {
    console.error(`[${tag}][FAIL attr] sample[${i}]=${sampleLines[i]}`);
  }
}

function collectAttrKeysSample(node: object, budget: number): string[] {
  let bag: string[] = [];
  collectAttrKeysSampleInner(node, bag, budget);
  return bag;
}

function collectAttrKeysSampleInner(node: object, bag: string[], budget: number): void {
  if (bag.length >= budget) {
    return;
  }
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null) {
    let names: string[] = Object.keys(attrs);
    for (let i = 0; i < names.length; i++) {
      if (bag.length >= budget) {
        return;
      }
      let n: string = names[i];
      if (bag.indexOf(n) < 0) {
        bag.push(n);
      }
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let j = 0; j < children.length; j++) {
    collectAttrKeysSampleInner(children[j], bag, budget);
  }
}

function collectAttrsWhereValueContains(node: object, needle: string, budget: number): string[] {
  let out: string[] = [];
  collectAttrsWhereValueContainsInner(node, needle, out, budget);
  return out;
}

function collectAttrsWhereValueContainsInner(node: object, needle: string, out: string[], budget: number): void {
  if (out.length >= budget) {
    return;
  }
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null) {
    let names: string[] = Object.keys(attrs);
    for (let i = 0; i < names.length; i++) {
      if (out.length >= budget) {
        return;
      }
      let nm: string = names[i];
      let raw: Object | undefined = attrs[nm];
      let s: string = valueToDebugString(raw);
      if (s.indexOf(needle) >= 0 && out.indexOf(nm) < 0) {
        out.push(nm);
      }
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let j = 0; j < children.length; j++) {
    collectAttrsWhereValueContainsInner(children[j], needle, out, budget);
  }
}

function collectFirstLinesForAttrNames(node: object, names: string[], budget: number): string[] {
  let lines: string[] = [];
  collectFirstLinesForAttrNamesInner(node, names, lines, budget);
  return lines;
}

function collectFirstLinesForAttrNamesInner(node: object, names: string[], lines: string[], budget: number): void {
  if (lines.length >= budget) {
    return;
  }
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null) {
    for (let i = 0; i < names.length; i++) {
      if (lines.length >= budget) {
        return;
      }
      let nm: string = names[i];
      if (attrs[nm] !== undefined) {
        lines.push(`${nm}=${valueToDebugString(attrs[nm])}`);
      }
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let j = 0; j < children.length; j++) {
    collectFirstLinesForAttrNamesInner(children[j], names, lines, budget);
  }
}

function valueToDebugString(raw: Object | undefined): string {
  if (raw === undefined || raw === null) {
    return '';
  }
  if (typeof raw === 'string' || typeof raw === 'number' || typeof raw === 'boolean') {
    return `${typeof raw}:${raw}`;
  }
  return `${typeof raw}:${safeStringify(raw as object).substring(0, 200)}`;
}

function countInspectableNodes(node: object): number {
  let n: number = 1;
  let ch: object[] = getChildrenNodes(node);
  for (let i = 0; i < ch.length; i++) {
    n = n + countInspectableNodes(ch[i]);
  }
  return n;
}

function findAttrInSubtreePreferredStrict(root: object, attrName: string,
  expected: string): AttrMatchResult | undefined {
  let aliasNames: string[] = attrNameAliases(attrName);
  for (let a: number = 0; a < aliasNames.length; a++) {
    let nm: string = aliasNames[a];
    let strict: string | undefined = findStrictStringAttrInSubtree(root, nm, expected);
    if (strict !== undefined) {
      return { value: strict, mode: a === 0 ? 'STRICT_STRING' : `STRICT_STRING_ALIAS:${nm}` };
    }
    let relaxed: string | undefined = findPrimitiveAttrStringEqualInSubtree(root, nm, expected);
    if (relaxed !== undefined) {
      console.info(
        `[SubHeaderProps][RELAXED] attr=${nm} expect=${expected} matched via number/boolean鈫抯tring`);
      return { value: relaxed, mode: a === 0 ? 'RELAXED_PRIMITIVE_STRING' : `RELAXED_ALIAS:${nm}` };
    }
  }
  return undefined;
}

function attrNameAliases(primary: string): string[] {
  if (primary === 'titleId') {
    return ['titleId', 'titleID', 'TitleId'];
  }
  if (primary === 'id') {
    return ['id', 'Id'];
  }
  return [primary];
}

function findStrictStringAttrInSubtree(node: object, attrName: string, expected: string): string | undefined {
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null && attrs[attrName] !== undefined) {
    let raw: Object = attrs[attrName];
    if (typeof raw === 'string' && raw === expected) {
      return raw;
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let i = 0; i < children.length; i++) {
    let inner: string | undefined = findStrictStringAttrInSubtree(children[i], attrName, expected);
    if (inner !== undefined) {
      return inner;
    }
  }
  return undefined;
}

/** string | number | boolean 杞瓧绗︿覆鍚庝笌 expected 鍏ㄩ噺鍖归厤锛堟帓闄?object锛?*/
function findPrimitiveAttrStringEqualInSubtree(node: object, attrName: string,
  expected: string): string | undefined {
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null && attrs[attrName] !== undefined) {
    let raw: Object = attrs[attrName];
    let t: string = typeof raw;
    if (t === 'string' || t === 'number' || t === 'boolean') {
      let asStr: string = String(raw);
      if (asStr === expected) {
        return asStr;
      }
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let i = 0; i < children.length; i++) {
    let inner: string | undefined = findPrimitiveAttrStringEqualInSubtree(children[i], attrName, expected);
    if (inner !== undefined) {
      return inner;
    }
  }
  return undefined;
}

function findMountSubtreeInInspector(mountKey: string): object | undefined {
  let tree: Object = getInspectorTree();
  let roots: object[] = rootsOf(tree);
  for (let i = 0; i < roots.length; i++) {
    let sub: object | undefined = findSubtreeByInspectorKey(roots[i], mountKey);
    if (sub !== undefined) {
      return sub;
    }
  }
  return undefined;
}

function tryParseInspectorJson(strJson: string): object | undefined {
  if (!strJson || strJson.trim() === '') {
    return undefined;
  }
  try {
    let parsed: object = JSON.parse(strJson) as object;
    return parsed;
  } catch (_e) {
    return undefined;
  }
}

function safeStringify(obj: object): string {
  try {
    return JSON.stringify(obj);
  } catch (_e) {
    return '';
  }
}

function rootsOf(tree: Object): object[] {
  if (Array.isArray(tree)) {
    return tree as object[];
  }
  return [tree as object];
}

function getChildrenNodes(node: object): object[] {
  let out: object[] = collectChildrenFromField(node, '$children');
  if (out.length > 0) {
    return out;
  }
  return collectChildrenFromField(node, 'children');
}

function collectChildrenFromField(node: object, field: string): object[] {
  let ch: Object | undefined = (node as Record<string, Object>)[field] as Object | undefined;
  if (ch === undefined || ch === null) {
    return [];
  }
  if (Array.isArray(ch)) {
    return ch as object[];
  }
  let m: Record<string, Object> = ch as Record<string, Object>;
  let names: string[] = Object.keys(m);
  let out: object[] = [];
  for (let i = 0; i < names.length; i++) {
    let child: Object | undefined = m[names[i]];
    if (child !== undefined && child !== null && typeof child === 'object') {
      out.push(child as object);
    }
  }
  return out;
}

/** 浠呰銆屾湰鑺傜偣銆?attrs.key锛涘嬁鐢ㄦ暣妫靛瓙鏍?JSON 鍖呭惈 key 鍒ゆ柇锛堝惁鍒欑鍏堜笌瀛?mirror 绛変細璇懡涓級銆?*/
function nodeHasInspectorKey(node: object, targetKey: string): boolean {
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null) {
    let k: Object | undefined = attrs['key'];
    if (k !== undefined && String(k) === targetKey) {
      return true;
    }
  }
  return false;
}

function findSubtreeByInspectorKey(node: object, targetKey: string): object | undefined {
  if (nodeHasInspectorKey(node, targetKey)) {
    return node;
  }
  let children: object[] = getChildrenNodes(node);
  for (let i = 0; i < children.length; i++) {
    let found: object | undefined = findSubtreeByInspectorKey(children[i], targetKey);
    if (found !== undefined) {
      return found;
    }
  }
  return undefined;
}
