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

export class ComponentInfo {
  $type: string;
  $rect: Object[];
  $attrs: ComponentAttrs;
}

export class ComponentAttrs {
  backgroundColor: string;
  switchPointColor: string;
  enabled: string;
  focusable: boolean;
  trackColor: string;
}

/**
 * {
 "$type": "Image",
 "$ID": 17,
 "$rect": "[288.00, 597.00],[432.00,741.00]",
 "$debugLine": "",
 "$attrs": {
 "borderStyle": "BorderStyle.Solid",
 "borderColor": "#FF000000",
 "borderWidth": "0.00vp",
 "borderRadius": {
 "topLeft": "0.00vp",
 "topRight": "0.00vp",
 "bottomLeft": "0.00vp",
 "bottomRight": "0.00vp"
 },
 "border": "{\"style\":\"BorderStyle.Solid\",\"color\":\"#FF000000\",\"width\":\"0.00vp\",\"radius\":{\"topLeft\":\"0.00vp\",\"topRight\":\"0.00vp\",\"bottomLeft\":\"0.00vp\",\"bottomRight\":\"0.00vp\"}}",
 "outlineStyle": "OutlineStyle.SOLID",
 "outlineColor": "#FF000000",
 "outlineWidth": "0.00vp",
 "outlineRadius": {
 "topLeft": "0.00vp",
 "topRight": "0.00vp",
 "bottomLeft": "0.00vp",
 "bottomRight": "0.00vp"
 },
 "outline": "{\"style\":\"OutlineStyle.SOLID\",\"color\":\"#FF000000\",\"width\":\"0.00vp\",\"radius\":{\"topLeft\":\"0.00vp\",\"topRight\":\"0.00vp\",\"bottomLeft\":\"0.00vp\",\"bottomRight\":\"0.00vp\"}}",
 "pointLight": {
 "lightIntensity": 0
 },
 "LightPosition": {},
 "borderImage": "{\"source\":\"\",\"slice\":\"0.00px\",\"width\":\"0.00px\",\"outset\":\"0.00px\",\"repeat\":\"RepeatMode.Stretch\",\"fill\":\"false\"}",
 "overlay": {
 "title": "",
 "options": {
 "align": "Alignment.Center",
 "offset": {
 "x": "0.00px",
 "y": "0.00px"
 }
 }
 },
 "position": {
 "x": "",
 "y": ""
 },
 "offset": {
 "x": "",
 "y": ""
 },
 "markAnchor": {
 "x": "",
 "y": ""
 },
 "backgroundImage": "NONE",
 "backgroundImageSize": "ImageSize.Auto",
 "backgroundImagePosition": {
 "x": 0,
 "y": 0
 },
 "backdropBlur": 0,
 "blur": 0,
 "grayscale": 0,
 "brightness": 1,
 "saturate": 1,
 "contrast": 1,
 "sepia": 0,
 "hueRotate": 0,
 "colorBlend": "",
 "blendMode": 0,
 "shadow": {
 "radius": "0.000000",
 "color": "#FF000000",
 "offsetX": "0.000000",
 "offsetY": "0.000000",
 "type": "0",
 "fill": "0"
 },
 "linearGradient": {},
 "sweepGradient": {},
 "radialGradient": {},
 "rotate": {},
 "scale": {},
 "translate": {},
 "clip": "false",
 "mask": {},
 "backgroundBlurStyle": {
 "value": "BlurStyle.NONE",
 "options": {
 "colorMode": "ThemeColorMode.System",
 "adaptiveColor": "AdaptiveColor.Default",
 "scale": 1
 }
 },
 "backgroundEffect": {
 "options": {
 "radius": 0,
 "saturation": 1,
 "brightness": 1,
 "color": "#00000000",
 "adaptiveColor": "AdaptiveColor.Default",
 "blurOption": "[0,0]"
 }
 },
 "transform": {},
 "backgroundColor": "#FF00FF00",
 "zIndex": 0,
 "opacity": 1,
 "lightUpEffect": 0,
 "sphericalEffect": 0,
 "pixelStretchEffect": {
 "left": "0.00px",
 "right": "0.00px",
 "top": "0.00px",
 "bottom": "0.00px"
 },
 "foregroundColor": "#00000001",
 "obscured": [],
 "renderGroup": "false",
 "renderFit": "RenderFit.TOP_LEFT",
 "useShadowBatching": "false",
 "scrollable": false,
 "width": "100.00vp",
 "height": "100.00vp",
 "size": {
 "width": "100.00vp",
 "height": "100.00vp"
 },
 "constraintSize": "{\"minWidth\":\"0.00vp\",\"minHeight\":\"0.00vp\",\"maxWidth\":\"Infinityvp\",\"maxHeight\":\"Infinityvp\"}",
 "align": "Alignment.Center",
 "layoutWeight": 0,
 "aspectRatio": "",
 "flexBasis": "auto",
 "flexGrow": 0,
 "flexShrink": 1,
 "alignSelf": "ItemAlign.Auto",
 "displayPriority": 1,
 "gridSpan": 1,
 "gridOffset": 0,
 "useSizeType": {
 "default": {
 "span": 1,
 "offset": 0
 }
 },
 "padding": "0.00vp",
 "margin": "0.00vp",
 "visibility": "Visibility.Visible",
 "direction": "Direction.Auto",
 "pixelRound": "{\"start\":\"PixelRoundCalcPolicy.NO_FORCE_ROUND\",\"top\":\"PixelRoundCalcPolicy.NO_FORCE_ROUND\",\"end\":\"PixelRoundCalcPolicy.NO_FORCE_ROUND\",\"bottom\":\"PixelRoundCalcPolicy.NO_FORCE_ROUND\"}",
 "alt": "",
 "objectFit": "ImageFit.Cover",
 "verticalAlign": "VerticalAlign.BOTTOM",
 "src": "",
 "rawSrc": "",
 "moduleName": "",
 "sourceSize": "[0.00 x 0.00]",
 "fitOriginalSize": "false",
 "autoResize": "true",
 "objectRepeat": "ImageRepeat.NoRepeat",
 "interpolation": "ImageInterpolation.None",
 "renderMode": "ImageRenderMode.Original",
 "matchTextDirection": "false",
 "fillColor": "#FF000000",
 "colorFilter": "",
 "copyOption": "CopyOptions.None",
 "syncLoad": "false",
 "draggable": "false",
 "enableAnalyzer": "false",
 "enabled": true,
 "focusable": false,
 "focused": false,
 "defaultFocus": false,
 "groupDefaultFocus": false,
 "focusOnTouch": false,
 "tabIndex": 0,
 "hoverEffect": "HoverEffect.Auto",
 "touchable": true,
 "hitTestBehavior": "HitTestMode.Default",
 "monopolizeEvents": false,
 "responseRegion": [],
 "mouseResponseRegion": [],
 "id": "OnClickTestImage"
 }
 }
 */