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

@Entry
@Component
struct UniversalAttributesTest {
  @State isShowSheet: boolean = false;

  @Builder
  sheetBuilder() {
    Column() {
      Text('Sheet Content').fontSize(20)
    }.width('100%').height('100%')
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        // ========== freeze(value: boolean) tests ==========
        Text('freeze').fontSize(16).width('90%')

        Row() {
          Text('freeze true').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('freeze_true')
        .freeze(true)

        Row() {
          Text('freeze false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('freeze_false')
        .freeze(false)

        // ========== translate(value: TranslateOptions) tests ==========
        Text('translate').fontSize(16).width('90%')

        Row() {
          Text('translate normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('translate_normal')
        .translate({ x: 10, y: 20, z: 0 })

        Row() {
          Text('translate x empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('translate_x_empty')
        .translate({ x: '', y: 20, z: 0 })

        Row() {
          Text('translate y empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('translate_y_empty')
        .translate({ x: 10, y: '', z: 0 })

        Row() {
          Text('translate z empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('translate_z_empty')
        .translate({ x: 10, y: 20, z: '' })

        Row() {
          Text('translate null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('translate_null')
        .translate(null)

        Row() {
          Text('translate undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('translate_undefined')
        .translate(undefined)

        // ========== scale(value: ScaleOptions) tests ==========
        Text('scale').fontSize(16).width('90%')

        Row() {
          Text('scale normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('scale_normal')
        .scale({ x: 2, y: 0.5 })

        Row() {
          Text('scale centerX empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('scale_centerX_empty')
        .scale({ x: 2, y: 0.5, centerX: '', centerY: '50%' })

        Row() {
          Text('scale centerY empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('scale_centerY_empty')
        .scale({ x: 2, y: 0.5, centerX: '50%', centerY: '' })

        Row() {
          Text('scale null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('scale_null')
        .scale(null)

        Row() {
          Text('scale undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('scale_undefined')
        .scale(undefined)

        // ========== rotate(value: RotateOptions) tests ==========
        Text('rotate').fontSize(16).width('90%')

        Row() {
          Text('rotate normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('rotate_normal')
        .rotate({ x: 0, y: 0, z: 1, angle: 90 })

        Row() {
          Text('rotate angle empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('rotate_angle_empty')
        .rotate({ x: 0, y: 0, z: 1, angle: '' })

        Row() {
          Text('rotate null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('rotate_null')
        .rotate(null)

        Row() {
          Text('rotate undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('rotate_undefined')
        .rotate(undefined)

        // ========== sharedTransition(id, options) tests ==========
        Text('sharedTransition').fontSize(16).width('90%')

        Row() {
          Text('sharedTransition normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_normal')
        .sharedTransition('testId', { duration: 500, curve: Curve.Linear })

        Row() {
          Text('sharedTransition curve empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_curve_empty')
        .sharedTransition('testId', { duration: 500, curve: '' })

        Row() {
          Text('sharedTransition motionPath rotatable true').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_rotatable_true')
        .sharedTransition('testId', { motionPath: { path: 'M0,0 L100,100', rotatable: true } })

        Row() {
          Text('sharedTransition motionPath rotatable false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_rotatable_false')
        .sharedTransition('testId', { motionPath: { path: 'M0,0 L100,100', rotatable: false } })

        Row() {
          Text('sharedTransition id empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_id_empty')
        .sharedTransition('', { duration: 500 })

        Row() {
          Text('sharedTransition id null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_id_null')
        .sharedTransition(null, { duration: 500 })

        Row() {
          Text('sharedTransition id undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_id_undefined')
        .sharedTransition(undefined, { duration: 500 })

        Row() {
          Text('sharedTransition options null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_options_null')
        .sharedTransition('testId', null)

        Row() {
          Text('sharedTransition options undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sharedTransition_options_undefined')
        .sharedTransition('testId', undefined)

        // ========== clickEffect(value: ClickEffect | null) tests ==========
        Text('clickEffect').fontSize(16).width('90%')

        Row() {
          Text('clickEffect normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('clickEffect_normal')
        .clickEffect({ level: ClickEffectLevel.LIGHT })

        Row() {
          Text('clickEffect null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('clickEffect_null')
        .clickEffect(null)

        // ========== linearGradient(value: LinearGradientOptions) tests ==========
        Text('linearGradient').fontSize(16).width('90%')

        Row() {
          Text('linearGradient normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('linearGradient_normal')
        .linearGradient({ angle: 90, colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('linearGradient angle empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('linearGradient_angle_empty')
        .linearGradient({ angle: '', colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('linearGradient null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('linearGradient_null')
        .linearGradient(null)

        Row() {
          Text('linearGradient undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('linearGradient_undefined')
        .linearGradient(undefined)

        // ========== sweepGradient(value: SweepGradientOptions) tests ==========
        Text('sweepGradient').fontSize(16).width('90%')

        Row() {
          Text('sweepGradient normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sweepGradient_normal')
        .sweepGradient({ center: [50, 50], start: 0, end: 360, colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('sweepGradient start empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sweepGradient_start_empty')
        .sweepGradient({ center: [50, 50], start: '', end: 360, colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('sweepGradient end empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sweepGradient_end_empty')
        .sweepGradient({ center: [50, 50], start: 0, end: '', colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('sweepGradient rotation empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sweepGradient_rotation_empty')
        .sweepGradient({ center: [50, 50], start: 0, end: 360, rotation: '', colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('sweepGradient repeating false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sweepGradient_repeating_false')
        .sweepGradient({ center: [50, 50], start: 0, end: 360, repeating: false, colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('sweepGradient null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sweepGradient_null')
        .sweepGradient(null)

        Row() {
          Text('sweepGradient undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('sweepGradient_undefined')
        .sweepGradient(undefined)

        // ========== radialGradient(value: RadialGradientOptions) tests ==========
        Text('radialGradient').fontSize(16).width('90%')

        Row() {
          Text('radialGradient normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('radialGradient_normal')
        .radialGradient({ center: [50, 50], radius: 60, colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('radialGradient repeating false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('radialGradient_repeating_false')
        .radialGradient({ center: [50, 50], radius: 60, repeating: false, colors: [[0xff0000, 0.0], [0x0000ff, 1.0]] })

        Row() {
          Text('radialGradient null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('radialGradient_null')
        .radialGradient(null)

        Row() {
          Text('radialGradient undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('radialGradient_undefined')
        .radialGradient(undefined)

        // ========== geometryTransition(id: string) tests ==========
        Text('geometryTransition').fontSize(16).width('90%')

        Row() {
          Text('geometryTransition normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('geometryTransition_normal')
        .geometryTransition('geoId')

        Row() {
          Text('geometryTransition id empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('geometryTransition_id_empty')
        .geometryTransition('')

        Row() {
          Text('geometryTransition id null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('geometryTransition_id_null')
        .geometryTransition(null)

        Row() {
          Text('geometryTransition id undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('geometryTransition_id_undefined')
        .geometryTransition(undefined)

        // ========== geometryTransition(id, options) tests ==========
        Row() {
          Text('geometryTransition with options normal').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('geometryTransition_options_normal')
        .geometryTransition('geoId', { follow: true })

        Row() {
          Text('geometryTransition options follow false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('geometryTransition_follow_false')
        .geometryTransition('geoId', { follow: false })

        Row() {
          Text('geometryTransition options null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('geometryTransition_options_null')
        .geometryTransition('geoId', null)

        Row() {
          Text('geometryTransition options undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('geometryTransition_options_undefined')
        .geometryTransition('geoId', undefined)

        // ========== bindSheet tests ==========
        Text('bindSheet').fontSize(16).width('90%')

        Row() {
          Text('bindSheet height FIT_CONTENT').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_height_fit_content')
        .bindSheet(false, this.sheetBuilder(), { height: SheetSize.FIT_CONTENT })

        Row() {
          Text('bindSheet dragBar false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_dragBar_false')
        .bindSheet(false, this.sheetBuilder(), { dragBar: false })

        Row() {
          Text('bindSheet enableFloatingDragBar true').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_enableFloatingDragBar_true')
        .bindSheet(false, this.sheetBuilder(), { enableFloatingDragBar: true })

        Row() {
          Text('bindSheet enableFloatingDragBar false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_enableFloatingDragBar_false')
        .bindSheet(false, this.sheetBuilder(), { enableFloatingDragBar: false })

        Row() {
          Text('bindSheet modalTransition DEFAULT').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_modalTransition_default')
        .bindSheet(false, this.sheetBuilder(), { modalTransition: ModalTransition.DEFAULT })

        Row() {
          Text('bindSheet modalTransition NONE').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_modalTransition_none')
        .bindSheet(false, this.sheetBuilder(), { modalTransition: ModalTransition.NONE })

        Row() {
          Text('bindSheet modalTransition ALPHA').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_modalTransition_alpha')
        .bindSheet(false, this.sheetBuilder(), { modalTransition: ModalTransition.ALPHA })

        Row() {
          Text('bindSheet blurStyle BACKGROUND_THICK').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_blurStyle_background_thick')
        .bindSheet(false, this.sheetBuilder(), { blurStyle: BlurStyle.BACKGROUND_THICK })

        Row() {
          Text('bindSheet preferType CONTENT_COVER').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_preferType_content_cover')
        .bindSheet(false, this.sheetBuilder(), { preferType: SheetType.CONTENT_COVER })

        Row() {
          Text('bindSheet shadow type COLOR').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_shadow_color')
        .bindSheet(false, this.sheetBuilder(), { shadow: { radius: 10, type: ShadowType.COLOR, color: '#000000' } })

        Row() {
          Text('bindSheet shadow type BLUR').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_shadow_blur')
        .bindSheet(false, this.sheetBuilder(), { shadow: { radius: 10, type: ShadowType.BLUR, color: '#000000' } })

        Row() {
          Text('bindSheet color empty').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_color_empty')
        .bindSheet(false, this.sheetBuilder(), { backgroundColor: '' })

        Row() {
          Text('bindSheet fill true').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_fill_true')
        .bindSheet(false, this.sheetBuilder(), { shadow: { radius: 10, fill: true, color: '#000000' } })

        Row() {
          Text('bindSheet fill false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_fill_false')
        .bindSheet(false, this.sheetBuilder(), { shadow: { radius: 10, fill: false, color: '#000000' } })

        Row() {
          Text('bindSheet shadow OUTER_DEFAULT_SM').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_shadow_outer_default_sm')
        .bindSheet(false, this.sheetBuilder(), { shadow: ShadowStyle.OUTER_DEFAULT_SM })

        Row() {
          Text('bindSheet shadow OUTER_DEFAULT_MD').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_shadow_outer_default_md')
        .bindSheet(false, this.sheetBuilder(), { shadow: ShadowStyle.OUTER_DEFAULT_MD })

        Row() {
          Text('bindSheet shadow OUTER_FLOATING_SM').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_shadow_outer_floating_sm')
        .bindSheet(false, this.sheetBuilder(), { shadow: ShadowStyle.OUTER_FLOATING_SM })

        Row() {
          Text('bindSheet shadow OUTER_FLOATING_MD').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_shadow_outer_floating_md')
        .bindSheet(false, this.sheetBuilder(), { shadow: ShadowStyle.OUTER_FLOATING_MD })

        Row() {
          Text('bindSheet scrollSizeMode CONTINUOUS').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_scrollSizeMode_continuous')
        .bindSheet(false, this.sheetBuilder(), { scrollSizeMode: ScrollSizeMode.CONTINUOUS })

        Row() {
          Text('bindSheet keyboardAvoidMode NONE').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_keyboardAvoidMode_none')
        .bindSheet(false, this.sheetBuilder(), { keyboardAvoidMode: SheetKeyboardAvoidMode.NONE })

        Row() {
          Text('bindSheet keyboardAvoidMode RESIZE_ONLY').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_keyboardAvoidMode_resize_only')
        .bindSheet(false, this.sheetBuilder(), { keyboardAvoidMode: SheetKeyboardAvoidMode.RESIZE_ONLY })

        Row() {
          Text('bindSheet keyboardAvoidMode POPUP_SHEET').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_keyboardAvoidMode_popup_sheet')
        .bindSheet(false, this.sheetBuilder(), { keyboardAvoidMode: SheetKeyboardAvoidMode.POPUP_SHEET })

        Row() {
          Text('bindSheet enableHoverMode false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_enableHoverMode_false')
        .bindSheet(false, this.sheetBuilder(), { enableHoverMode: false })

        Row() {
          Text('bindSheet hoverModeArea BOTTOM_SCREEN').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_hoverModeArea_bottom_screen')
        .bindSheet(false, this.sheetBuilder(), { hoverModeArea: HoverModeAreaType.BOTTOM_SCREEN })

        Row() {
          Text('bindSheet detentSelection MEDIUM').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_detentSelection_medium')
        .bindSheet(false, this.sheetBuilder(), { detents: [SheetSize.MEDIUM, SheetSize.LARGE], detentSelection: SheetSize.MEDIUM })

        Row() {
          Text('bindSheet detentSelection LARGE').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_detentSelection_large')
        .bindSheet(false, this.sheetBuilder(), { detents: [SheetSize.MEDIUM, SheetSize.LARGE], detentSelection: SheetSize.LARGE })

        Row() {
          Text('bindSheet detentSelection FIT_CONTENT').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_detentSelection_fit_content')
        .bindSheet(false, this.sheetBuilder(), { detents: [SheetSize.MEDIUM, SheetSize.FIT_CONTENT], detentSelection: SheetSize.FIT_CONTENT })

        Row() {
          Text('bindSheet showInSubWindow true').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_showInSubWindow_true')
        .bindSheet(false, this.sheetBuilder(), { showInSubWindow: true })

        Row() {
          Text('bindSheet showInSubWindow false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_showInSubWindow_false')
        .bindSheet(false, this.sheetBuilder(), { showInSubWindow: false })

        Row() {
          Text('bindSheet placementOnTarget false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_placementOnTarget_false')
        .bindSheet(false, this.sheetBuilder(), { preferType: SheetType.POPUP, placementOnTarget: false })

        Row() {
          Text('bindSheet options null').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_options_null')
        .bindSheet(false, this.sheetBuilder(), null)

        Row() {
          Text('bindSheet options undefined').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_options_undefined')
        .bindSheet(false, this.sheetBuilder(), undefined)

        Row() {
          Text('bindSheet isShow false').width('100%').height('5%')
        }
        .width('100%')
        .height('5%')
        .id('bindSheet_isShow_false')
        .bindSheet(false, this.sheetBuilder(), {})

        // ========== queryNavDestinationInfo isInner tests ==========
        // Note: This needs to be in a NavDestination context, will be tested separately
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}