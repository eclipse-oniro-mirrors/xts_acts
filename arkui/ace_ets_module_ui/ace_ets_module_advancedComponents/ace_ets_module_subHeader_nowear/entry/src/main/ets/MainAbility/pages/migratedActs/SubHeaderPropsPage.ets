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
 * SubHeader / SubHeaderV2 测试页：
 * - **六块独立场景**（`SubHeaderScene*`）：Hypium 单测通过 `router.pushUrl` 传
 *   `params[SUBHEADER_ROUTE_PARAM]`（见 `SubHeaderPropsInstrumentRoute`）。
 * - **无参或 `route=subheader`**：`SubHeaderPropsTestContent` 六块纵向拼接全量预览。
 *
 * 文档与扩展字段说明见各场景顶部注释；测试辅助 Text 与入参同源 @State，非官方 API。
 */
import router from '@ohos.router';
import {
  SubHeader,
  OperationType,
  SubHeaderV2,
  SubHeaderV2Title,
  SubHeaderV2Select,
  SubHeaderV2OperationItem,
  SubHeaderV2OperationType,
} from '@kit.ArkUI';
import type {
  SubHeaderV2TitleOptions,
  SubHeaderV2SelectOptions,
  SubHeaderV2OperationItemOptions,
} from '@ohos.arkui.advanced.SubHeaderV2';

/** Hypium 单屏路由（本文件自包含，避免依赖外部 TestShellRoute） */
export class SubHeaderPropsInstrumentRoute {
  public static readonly SUBHEADER_V1_OPERATION: string = 'subheader_v1_operation';
  public static readonly SUBHEADER_V1_SELECT: string = 'subheader_v1_select';
  public static readonly SUBHEADER_V1_TITLE: string = 'subheader_v1_title';
  public static readonly SUBHEADER_V2_TITLE: string = 'subheader_v2_title';
  public static readonly SUBHEADER_V2_SELECT: string = 'subheader_v2_select';
  public static readonly SUBHEADER_V2_OPERATION: string = 'subheader_v2_operation';
}

/** 与 `main_pages.json` 中路径一致 */
export const SUBHEADER_PROPS_PAGE: string = 'MainAbility/pages/migratedActs/SubHeaderPropsPage';

/** `router.pushUrl` 参数键：`params[SUBHEADER_ROUTE_PARAM] = SubHeaderPropsInstrumentRoute.*` */
export const SUBHEADER_ROUTE_PARAM: string = 'route';

interface SubHeaderV2TitleOptionsWithId extends SubHeaderV2TitleOptions {
  id?: string;
}

interface SubHeaderV2SelectOptionsWithId extends SubHeaderV2SelectOptions {
  id?: string;
}

interface SubHeaderV2OperationItemOptionsWithId extends SubHeaderV2OperationItemOptions {
  id?: string;
}

interface PageSelectOptionRow {
  value: ResourceStr;
}

class PageSelectOptions {
  public options?: PageSelectOptionRow[] = undefined;
  public selected?: number = undefined;
  public value?: ResourceStr = undefined;
  public onSelect?: (index: number, value?: string) => void = undefined;
  public defaultFocus?: boolean = undefined;
  public id?: string = undefined;
}

class PageOperationOption {
  public value?: ResourceStr = undefined;
  public action?: () => void = undefined;
  public id?: string = undefined;
}

class SubHeaderV1UiArgs {
  public primaryTitle?: ResourceStr = undefined;
  public secondaryTitle?: ResourceStr = undefined;
  public titleId?: string = undefined;
  public operationType?: OperationType = undefined;
  public select?: PageSelectOptions = undefined;
  public operationItem?: PageOperationOption[] = undefined;
}

function newPageSelectOptionsFilled(): PageSelectOptions {
  let pso: PageSelectOptions = new PageSelectOptions();
  let t0: PageSelectOptionRow = { value: 'T1' };
  let t1: PageSelectOptionRow = { value: 'T2' };
  pso.options = [t0, t1];
  pso.selected = 0;
  pso.value = 'T1';
  pso.onSelect = (_index: number, _value?: string): void => {
  };
  return pso;
}

function newPageOperationOptionWithValue(): PageOperationOption {
  let po: PageOperationOption = new PageOperationOption();
  po.value = 'OP';
  po.action = (): void => {
  };
  return po;
}

/** V1：仅测 operationItem.id；select / titleId 不传 id */
@Component
export struct SubHeaderSceneV1OperationId {
  @State private primary: string = 'OH_SUBTEST_V1_PRIMARY';
  @State private secondary: string = 'OH_SUBTEST_V1_SECONDARY';
  @State private idOperation: string = 'OH_ID_V1_OPERATION_OPTION';

  build() {
    Column({ space: 12 }) {
      Text('用例：SubHeader V1 — operationItem.id')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
      Text(this.idOperation).key('mirror_id_v1_operation_option').fontSize(10)
      SubHeader(this.buildArgs() as Object)
        .width('100%')
        .key('mount_sh_v1_operation')
    }
    .width('100%')
    .padding(12)
  }

  private buildArgs(): SubHeaderV1UiArgs {
    let pso: PageSelectOptions = newPageSelectOptionsFilled();
    let po: PageOperationOption = newPageOperationOptionWithValue();
    po.id = this.idOperation;
    let args: SubHeaderV1UiArgs = new SubHeaderV1UiArgs();
    args.primaryTitle = this.primary;
    args.secondaryTitle = this.secondary;
    args.operationType = OperationType.BUTTON;
    args.select = pso;
    args.operationItem = [po];
    return args;
  }
}

/** V1：仅测 SelectOptions.id；operation 不传 id；不传 titleId */
@Component
export struct SubHeaderSceneV1SelectId {
  @State private primary: string = 'OH_SUBTEST_V1_PRIMARY';
  @State private secondary: string = 'OH_SUBTEST_V1_SECONDARY';
  @State private idSelect: string = 'OH_ID_V1_SELECT_OPTIONS';

  build() {
    Column({ space: 12 }) {
      Text('用例：SubHeader V1 — SelectOptions.id')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
      Text(this.idSelect).key('mirror_id_v1_select_options').fontSize(10)
      SubHeader(this.buildArgs() as Object)
        .width('100%')
        .key('mount_sh_v1_select')
    }
    .width('100%')
    .padding(12)
  }

  private buildArgs(): SubHeaderV1UiArgs {
    let pso: PageSelectOptions = newPageSelectOptionsFilled();
    pso.id = this.idSelect;
    let po: PageOperationOption = newPageOperationOptionWithValue();
    let args: SubHeaderV1UiArgs = new SubHeaderV1UiArgs();
    args.primaryTitle = this.primary;
    args.secondaryTitle = this.secondary;
    args.operationType = OperationType.BUTTON;
    args.select = pso;
    args.operationItem = [po];
    return args;
  }
}

/** V1：仅测 titleId；select / operation 不传 id */
@Component
export struct SubHeaderSceneV1TitleId {
  @State private primary: string = 'OH_SUBTEST_V1_PRIMARY';
  @State private secondary: string = 'OH_SUBTEST_V1_SECONDARY';
  @State private titleId: string = 'OH_ID_V1_TITLE_ID';

  build() {
    Column({ space: 12 }) {
      Text('用例：SubHeader V1 — titleId')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
      Text(this.titleId).key('mirror_id_v1_title_id').fontSize(10)
      SubHeader(this.buildArgs() as Object)
        .width('100%')
        .key('mount_sh_v1_title')
    }
    .width('100%')
    .padding(12)
  }

  private buildArgs(): SubHeaderV1UiArgs {
    let pso: PageSelectOptions = newPageSelectOptionsFilled();
    let po: PageOperationOption = newPageOperationOptionWithValue();
    let args: SubHeaderV1UiArgs = new SubHeaderV1UiArgs();
    args.primaryTitle = this.primary;
    args.secondaryTitle = this.secondary;
    args.titleId = this.titleId;
    args.operationType = OperationType.BUTTON;
    args.select = pso;
    args.operationItem = [po];
    return args;
  }
}

/** V2：仅 Title 段带 id（Select / OperationItem 不带 id） */
@Component
export struct SubHeaderSceneV2TitleId {
  @State private primary: string = 'OH_SUBTEST_V2_PRIMARY';
  @State private secondary: string = 'OH_SUBTEST_V2_SECONDARY';
  @State private idTitle: string = 'OH_ID_V2_TITLE_OPTIONS';

  build() {
    Column({ space: 12 }) {
      Text('用例：SubHeaderV2 — SubHeaderV2Title.id（options / trace 两条用例共本屏）')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
      Text(this.idTitle).key('mirror_id_v2_title_options').fontSize(10)
      SubHeaderV2({
        title: new SubHeaderV2Title(this.buildTitle()),
        select: new SubHeaderV2Select(this.buildSelectNoId()),
        operationType: SubHeaderV2OperationType.BUTTON,
        operationItems: [new SubHeaderV2OperationItem(this.buildOpNoId())]
      })
        .width('100%')
        .key('mount_sh_v2_title')
    }
    .width('100%')
    .padding(12)
  }

  private buildTitle(): SubHeaderV2TitleOptions {
    let o: SubHeaderV2TitleOptionsWithId = {
      primaryTitle: this.primary,
      secondaryTitle: this.secondary,
      id: this.idTitle
    };
    return o as SubHeaderV2TitleOptions;
  }

  private buildSelectNoId(): SubHeaderV2SelectOptions {
    let s0: PageSelectOptionRow = { value: 'S0' };
    let s1: PageSelectOptionRow = { value: 'S1' };
    let o: SubHeaderV2SelectOptions = {
      options: [s0, s1],
      selectedIndex: 0,
      selectedContent: 'S0'
    };
    return o;
  }

  private buildOpNoId(): SubHeaderV2OperationItemOptions {
    let o: SubHeaderV2OperationItemOptions = { content: 'V2OP' };
    return o;
  }
}

/** V2：仅 Select 段带 id */
@Component
export struct SubHeaderSceneV2SelectId {
  @State private primary: string = 'OH_SUBTEST_V2_PRIMARY';
  @State private secondary: string = 'OH_SUBTEST_V2_SECONDARY';
  @State private idSelect: string = 'OH_ID_V2_SELECT_OPTIONS';

  build() {
    Column({ space: 12 }) {
      Text('用例：SubHeaderV2 — SubHeaderV2Select.id（options / trace 两条用例共本屏）')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
      Text(this.idSelect).key('mirror_id_v2_select_options').fontSize(10)
      SubHeaderV2({
        title: new SubHeaderV2Title(this.buildTitleNoId()),
        select: new SubHeaderV2Select(this.buildSelect()),
        operationType: SubHeaderV2OperationType.BUTTON,
        operationItems: [new SubHeaderV2OperationItem(this.buildOpNoId())]
      })
        .width('100%')
        .key('mount_sh_v2_select')
    }
    .width('100%')
    .padding(12)
  }

  private buildTitleNoId(): SubHeaderV2TitleOptions {
    let o: SubHeaderV2TitleOptions = {
      primaryTitle: this.primary,
      secondaryTitle: this.secondary
    };
    return o;
  }

  private buildSelect(): SubHeaderV2SelectOptions {
    let s0: PageSelectOptionRow = { value: 'S0' };
    let s1: PageSelectOptionRow = { value: 'S1' };
    let o: SubHeaderV2SelectOptionsWithId = {
      options: [s0, s1],
      selectedIndex: 0,
      selectedContent: 'S0',
      id: this.idSelect
    };
    return o as SubHeaderV2SelectOptions;
  }

  private buildOpNoId(): SubHeaderV2OperationItemOptions {
    let o: SubHeaderV2OperationItemOptions = { content: 'V2OP' };
    return o;
  }
}

/** V2：仅 OperationItem 段带 id */
@Component
export struct SubHeaderSceneV2OperationId {
  @State private primary: string = 'OH_SUBTEST_V2_PRIMARY';
  @State private secondary: string = 'OH_SUBTEST_V2_SECONDARY';
  @State private idOp: string = 'OH_ID_V2_OPERATION_ITEM_OPTIONS';

  build() {
    Column({ space: 12 }) {
      Text('用例：SubHeaderV2 — SubHeaderV2OperationItem.id（options / trace 两条用例共本屏）')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
      Text(this.idOp).key('mirror_id_v2_operation_item_options').fontSize(10)
      SubHeaderV2({
        title: new SubHeaderV2Title(this.buildTitleNoId()),
        select: new SubHeaderV2Select(this.buildSelectNoId()),
        operationType: SubHeaderV2OperationType.BUTTON,
        operationItems: [new SubHeaderV2OperationItem(this.buildOp())]
      })
        .width('100%')
        .key('mount_sh_v2_operation')
    }
    .width('100%')
    .padding(12)
  }

  private buildTitleNoId(): SubHeaderV2TitleOptions {
    let o: SubHeaderV2TitleOptions = {
      primaryTitle: this.primary,
      secondaryTitle: this.secondary
    };
    return o;
  }

  private buildSelectNoId(): SubHeaderV2SelectOptions {
    let s0: PageSelectOptionRow = { value: 'S0' };
    let s1: PageSelectOptionRow = { value: 'S1' };
    let o: SubHeaderV2SelectOptions = {
      options: [s0, s1],
      selectedIndex: 0,
      selectedContent: 'S0'
    };
    return o;
  }

  private buildOp(): SubHeaderV2OperationItemOptions {
    let o: SubHeaderV2OperationItemOptionsWithId = {
      content: 'V2OP',
      id: this.idOp
    };
    return o as SubHeaderV2OperationItemOptions;
  }
}

/** 全量预览：六块场景纵向排列（挂载 key 与单测屏一致，便于对照） */
@Component
export struct SubHeaderPropsTestContent {
  build() {
    Scroll() {
      Column({ space: 24 }) {
        Text('以下为 6 块独立场景纵向拼接；Hypium 单测请 push 本页并传 params.route（见文件头说明）。')
          .fontSize(11)
          .fontColor($r('sys.color.ohos_id_color_text_secondary'))
        SubHeaderSceneV1OperationId()
        Divider().strokeWidth(1)
        SubHeaderSceneV1SelectId()
        Divider().strokeWidth(1)
        SubHeaderSceneV1TitleId()
        Divider().strokeWidth(1)
        SubHeaderSceneV2TitleId()
        Divider().strokeWidth(1)
        SubHeaderSceneV2SelectId()
        Divider().strokeWidth(1)
        SubHeaderSceneV2OperationId()
      }
      .width('100%')
      .padding({ bottom: 40 })
    }
    .width('100%')
    .height('100%')
  }
}

@Entry
@Component
struct SubHeaderPropsPage {
  /** 无参：全量预览；有值且为单场景：仅挂载对应 `SubHeaderScene*` */
  @State private shellRoute: string = '';

  aboutToAppear(): void {
    let p: Object | undefined = router.getParams();
    if (p !== undefined) {
      let rec: Record<string, Object> = p as Record<string, Object>;
      let r: Object | undefined = rec[SUBHEADER_ROUTE_PARAM];
      if (typeof r === 'string' && (r as string).length > 0) {
        this.shellRoute = r as string;
      }
    }
  }

  build() {
    Column() {
      if (this.isSubHeaderSingleInstrumentScene()) {
        this.buildSubHeaderInstrumentOnly()
      } else {
        SubHeaderPropsTestContent()
      }
    }
    .width('100%')
    .height('100%')
  }

  private isSubHeaderSingleInstrumentScene(): boolean {
    return this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V1_OPERATION ||
      this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V1_SELECT ||
      this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V1_TITLE ||
      this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V2_TITLE ||
      this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V2_SELECT ||
      this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V2_OPERATION;
  }

  @Builder
  buildSubHeaderInstrumentOnly() {
    Scroll() {
      Column({ space: 16 }) {
        Text('Instrument：SubHeader（单用例单屏）')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
        Text(`route：${this.shellRoute}`)
          .fontSize(11)
          .fontColor($r('sys.color.ohos_id_color_text_secondary'))
        if (this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V1_OPERATION) {
          SubHeaderSceneV1OperationId()
        } else if (this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V1_SELECT) {
          SubHeaderSceneV1SelectId()
        } else if (this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V1_TITLE) {
          SubHeaderSceneV1TitleId()
        } else if (this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V2_TITLE) {
          SubHeaderSceneV2TitleId()
        } else if (this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V2_SELECT) {
          SubHeaderSceneV2SelectId()
        } else if (this.shellRoute === SubHeaderPropsInstrumentRoute.SUBHEADER_V2_OPERATION) {
          SubHeaderSceneV2OperationId()
        }
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 8, bottom: 32 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Auto)
  }
}
