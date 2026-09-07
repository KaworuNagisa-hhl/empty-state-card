# empty-state-card

`empty-state-card` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 毛玻璃空态卡片组件，适合空列表、无记录、无权限或首次使用引导。组件内部组合独立的 `panel` 和 `icon-badge`，默认是黑色优先的纯色毛玻璃卡片，可自定义颜色、宽高、圆角、图标、字号、操作按钮高度和操作区域。

## 实际运行效果

下面展示空态卡片、图标徽标和主操作按钮的毛玻璃状态：

![empty state card preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/empty-state-card@main/docs/empty-state-card-preview.gif)

## 安装

```bash
ohpm install empty-state-card
```

本地源码依赖：

```json5
{
  "dependencies": {
    "empty-state-card": "file:../empty-state-card",
    "theme": "file:../theme"
  }
}
```

## 正常使用样式

```ts
import { SwiftUIEmptyStateCard } from 'empty-state-card'
import { SwiftUITone } from 'theme'

@Component
struct EmptyRecordsCard {
  build() {
    SwiftUIEmptyStateCard({
      title: '暂无健康记录',
      message: '添加第一条记录后，会在这里显示趋势和提醒。',
      icon: '+',
      actionText: '添加记录',
      tone: SwiftUITone.GlassBlack,
      onAction: () => {
        console.info('create health record')
      }
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIEmptyStateCard({
  title: '暂无同步设备',
  message: '连接设备后可自动同步数据。',
  icon: 'D',
  actionText: '连接设备',
  componentWidth: '92%',
  componentHeight: 'auto',
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  customBorderColor: '#33FFFFFF',
  cornerRadius: 8,
  iconColor: '#141414',
  iconSize: 40,
  actionColor: '#141414',
  actionHeight: 44,
  titleFontSize: 18,
  messageFontSize: 14
})
```

## SwiftUI 风格链式配置

```ts
import { swiftUIConfig, SwiftUITone } from theme

const glassStyle = swiftUIConfig()
  .withTone(SwiftUITone.SystemGray)
  .withWidth(92%)
  .withHeight(auto)
  .withRadius(8)
  .withFillColor(#E6111111)
  .withTintColor(#22FFFFFF)
  .withBorder(#33FFFFFF, 1)
  .withShadow(#33000000, 16)
  .withPadding(12)

SwiftUIEmptyStateCard({
  config: glassStyle
})
```

`config` 是可选入口，适合复用一组 SwiftUI modifier 风格的外观配置；原有直接传参方式仍然可用，且业务可以继续通过 Builder 注入自定义内容。

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `config` | `SwiftUIComponentConfig` | 空配置 | SwiftUI modifier 风格链式配置，可覆盖宽高、圆角、颜色、边框、阴影、内边距等通用外观 |
| `title` | `ResourceStr` | `''` | 空态标题 |
| `message` | `ResourceStr` | `''` | 空态说明 |
| `icon` | `ResourceStr` | `''` | 图标字符 |
| `actionText` | `ResourceStr` | `''` | 默认按钮文本 |
| `actionColor` | `ResourceColor` | 黑色主色 | 按钮强调色 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `'100%'` | 卡片宽度 |
| `componentHeight` | `Length` | `'auto'` | 卡片高度 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 渐变叠色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `cornerRadius` | `number` | `12` | 圆角 |
| `iconColor` | `ResourceColor` | 黑色主色 | 图标颜色 |
| `iconSize` | `Length` | `32` | 图标徽标尺寸 |
| `actionHeight` | `Length` | `42` | 操作按钮高度 |
| `titleFontSize` | `number` | `17` | 标题字号 |
| `messageFontSize` | `number` | `15` | 说明字号 |
| `onAction` | `() => void` | 空函数 | 默认按钮点击回调 |
| `actionBuilder` | `() => void` | 无 | 自定义操作区域内容 |
