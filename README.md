# CityExplorer

这是我的结课作业。

## 功能与知识点对应表
| 功能 | 简要说明 | 关键知识点 |
| --- | --- | --- |
| 景点列表与详情 | 通过 `UITableView` 展示景点列表并使用 segue 进入详情页，详情页展示图片、评分、开放时间、地址、评论，同时支持本地视频播放。 | 表视图数据源与代理、Storyboard segue、自动布局动态评论视图、`AVPlayerViewController` 视频播放。【F:CityExplorer5/CityExplorer/Controllers/AttractionsListViewController.swift†L11-L68】【F:CityExplorer5/CityExplorer/Controllers/AttractionDetailViewController.swift†L13-L180】 |
| 景点数据管理 | 使用 `DataManager` 单例加载本地模拟景点数据并提供查询接口，便于各页面复用。 | 单例模式、数据初始化、模型查询接口设计。【F:CityExplorer5/CityExplorer/Utils/DataManager.swift†L11-L173】 |
| 用户注册与登录 | 支持本地注册账号并存储凭据，登录后切换到主界面，错误时弹窗提示。 | `UserDefaults` 本地存储、表单校验、根控制器切换、`UIAlertController` 交互。【F:CityExplorer5/CityExplorer/Controllers/RegisterViewController.swift†L11-L62】【F:CityExplorer5/CityExplorer/Controllers/LoginViewController.swift†L11-L63】 |
| 实用工具入口及天气查询 | 工具页以 `UICollectionView` 展示入口，天气查询通过第三方接口获取并解析实时天气，其余工具以占位弹窗提示。 | 集合视图布局与代理、`URLSession` 网络请求、`JSONSerialization` 解析、主线程 UI 更新、`UIAlertController` 占位提示。【F:CityExplorer5/CityExplorer/Controllers/ToolsViewController.swift†L11-L96】【F:CityExplorer5/CityExplorer/Controllers/WeatherViewController.swift†L15-L74】 |
| 景点与评论模型 | 定义景点及评论的数据结构，支撑列表、详情和数据管理逻辑。 | Swift 结构体建模、自定义初始化器、可选视频字段与评论集合。【F:CityExplorer5/CityExplorer/Models/Attraction.swift†L11-L42】 |
