-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2023 at 03:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_site`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Programming languages', 'programming-languages', 'programming-languages-2023-12-27-658c469fd82fc.jfif', '2023-12-27 00:09:02', '2023-12-27 23:45:36'),
(3, 'Front-end frameworks', 'front-end-frameworks', 'front-end-frameworks-2023-12-26-658afc4e579c7.png', '2023-12-27 00:16:14', '2023-12-27 00:16:14'),
(4, 'back-end frameworks', 'back-end-frameworks', 'back-end-frameworks-2023-12-26-658afc6adccab.png', '2023-12-27 00:16:42', '2023-12-27 00:16:42'),
(5, 'markup languages', 'markup-languages', 'markup-languages-2023-12-26-658aff0beaf90.jfif', '2023-12-27 00:27:55', '2023-12-27 00:27:55'),
(6, 'stylesheet languages', 'stylesheet-languages', 'stylesheet-languages-2023-12-26-658affd961467.jfif', '2023-12-27 00:31:21', '2023-12-27 00:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

CREATE TABLE `category_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 2, 3, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 4, 4, NULL, NULL),
(5, 5, 4, NULL, NULL),
(6, 6, 5, NULL, NULL),
(7, 7, 6, NULL, NULL),
(8, 8, 6, NULL, NULL),
(9, 9, 5, NULL, NULL),
(10, 10, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(4, 2, 6, 'thank you for your post', '2023-12-27 00:59:56', '2023-12-27 00:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_11_170247_create_tags_table', 1),
(5, '2020_12_11_174225_create_roles_table', 1),
(6, '2020_12_13_051759_create_categories_table', 1),
(7, '2020_12_15_070019_create_posts_table', 1),
(8, '2020_12_15_070309_create_category_post_table', 1),
(9, '2020_12_15_070432_create_post_tag_table', 1),
(10, '2020_12_23_104423_create_subscribes_table', 1),
(11, '2020_12_24_175358_create_jobs_table', 1),
(12, '2020_12_28_152119_create_post_user_table', 1),
(13, '2020_12_30_185832_create_comments_table', 1),
(14, '2021_01_04_160619_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0bda7e0d-835e-41f0-af37-142ae62964c0', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 9, '{\"name\":\"hazrat\",\"title\":\"Why XSL won\\u2019t replace CSS?\",\"time\":\"2023-12-27T16:25:56.000000Z\",\"slug\":\"why-xsl-wont-replace-css\"}', NULL, '2023-12-28 00:26:03', '2023-12-28 00:26:03'),
('20d0f3ec-5475-4b65-a94b-eb41c1ce9ae9', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 8, '{\"name\":\"rakib\",\"title\":\"What is Node.js (Node)?\",\"time\":\"2023-12-27T16:25:04.000000Z\",\"slug\":\"what-is-nodejs-node\"}', NULL, '2023-12-28 00:25:13', '2023-12-28 00:25:13'),
('233335bc-1ad3-441c-92d8-d9211303ac44', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 9, '{\"name\":\"hazrat\",\"title\":\"CSS: Cascading Style Sheets\",\"time\":\"2023-12-27T16:26:39.000000Z\",\"slug\":\"css-cascading-style-sheets\"}', NULL, '2023-12-28 00:26:47', '2023-12-28 00:26:47'),
('2c6af887-bc6e-4f18-9f18-4068297f1aa7', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 3, '{\"name\":\"Sumon Rana\",\"title\":\"9 Benefits of Using Bootstrap for Landing Pages\",\"time\":\"2023-12-27T09:02:19.000000Z\",\"slug\":\"9-benefits-of-using-bootstrap-for-landing-pages\"}', NULL, '2023-12-27 17:02:25', '2023-12-27 17:02:25'),
('89dd47b6-d150-43c2-91e6-15fafaa8c8ad', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 3, '{\"name\":\"Sumon Rana\",\"title\":\"What is Core Java\",\"time\":\"2023-12-28T02:52:35.000000Z\",\"slug\":\"what-is-core-java\"}', NULL, '2023-12-28 10:52:40', '2023-12-28 10:52:40'),
('9c4b6894-3a35-417b-b23c-8deea7dc566c', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 9, '{\"name\":\"hazrat\",\"title\":\"The PHP Framework for Web Artisans\",\"time\":\"2023-12-27T16:25:21.000000Z\",\"slug\":\"the-php-framework-for-web-artisans\"}', NULL, '2023-12-28 00:25:27', '2023-12-28 00:25:27'),
('bc86b291-8308-4080-b1a0-208a5708151d', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 2, '{\"name\":\"Sumon Rana\",\"title\":\"Lorem Ipsum is simply dummy text of the printing\",\"time\":\"2023-12-19T18:48:08.000000Z\",\"slug\":\"lorem-ipsum-is-simply-dummy-text-of-the-printing\"}', NULL, '2023-12-20 02:48:14', '2023-12-20 02:48:14'),
('d90eb779-0ed8-419d-aa31-63b0d9e97c2e', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 9, '{\"name\":\"hazrat\",\"title\":\"HTML Document Structure Before And After HTML5 \\u2013 Here\\u2019s What Changed\",\"time\":\"2023-12-27T16:25:42.000000Z\",\"slug\":\"html-document-structure-before-and-after-html5-heres-what-changed\"}', NULL, '2023-12-28 00:25:47', '2023-12-28 00:25:47'),
('ee8977e1-7ff7-42c1-9d83-517adc848c25', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 3, '{\"name\":\"Sumon Rana\",\"title\":\"The benefits of ReactJS and reasons to choose it for your project\",\"time\":\"2023-12-26T16:46:48.000000Z\",\"slug\":\"the-benefits-of-reactjs-and-reasons-to-choose-it-for-your-project\"}', NULL, '2023-12-27 00:46:54', '2023-12-27 00:46:54'),
('f3600b9d-3869-4bc6-a00d-3129ff54f1ad', 'App\\Notifications\\AuthorPostApproved', 'App\\Models\\User', 9, '{\"name\":\"hazrat\",\"title\":\"What is Difference Between HTML and XHTML?\",\"time\":\"2023-12-27T16:26:18.000000Z\",\"slug\":\"what-is-difference-between-html-and-xhtml\"}', NULL, '2023-12-28 00:26:28', '2023-12-28 00:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL DEFAULT 'default.png',
  `body` text NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(2, 3, 'The benefits of ReactJS and reasons to choose it for your project', 'the-benefits-of-reactjs-and-reasons-to-choose-it-for-your-project', 'the-benefits-of-reactjs-and-reasons-to-choose-it-for-your-project-2023-12-26-658b026a44e0e.png', '<p>You must be thinking, with so many JavaScript libraries out there, why should I use React JS for my next project?</p>\r\n<p>The truth is, in today\'s complex data-driven landscape, you can\'t just use any library. As web apps grow more dynamic, many solutions start to strain and crack. You need something robust yet flexible.</p>\r\n<p>Here, React JS solves all your problems.</p>\r\n<p>React, which was created by Facebook, has quickly emerged as the go-to library for creating smooth, scalable user interfaces. React\'s component-based architecture and intelligent diffing algorithm make&nbsp;<a href=\"https://www.peerbits.com/frontend-development.html\" target=\"_blank\">front-end development</a>&nbsp;more efficient as complexity grows.</p>\r\n<p>In this post, we\'ll explore the top benefits and 13 reasons why React may be the best choice for your next web project.</p>\r\n<p>By the end, you\'ll have a solid understanding of React\'s capabilities to determine if it\'s the right fit for your needs.</p>\r\n<p>Let&rsquo;s start with some basic understanding of React JS:</p>\r\n<h2 id=\"what-is-react-js\">What is React JS?</h2>\r\n<p><a href=\"https://react.dev/\" target=\"_blank\" rel=\"nofollow\">React JS</a>&nbsp;is basically a JavaScript library built and maintained by Facebook. According to the creator of React JS, Jordan Walke, React is an efficient, declarative, and flexible open-source JavaScript library for building simple, fast, and scalable frontends of web applications.</p>\r\n<p>Ever since its launch, it has taken the front-end development space by storm.</p>\r\n<p>As per the study made by&nbsp;<a href=\"https://www.statista.com/statistics/1124699/worldwide-developer-survey-most-used-frameworks-web/\" target=\"_blank\" rel=\"nofollow\">Statista</a>&nbsp;in 2022, Node.js is the most used framework globally, React stands second while Angular ranked 5th on the same list.&nbsp;</p>\r\n<p>Today, there are over 12,682,010 live websites using React. Not only that, but industry giants like Apple, Netflix, Paypal, and many others have also already started using React JS in their software productions.</p>\r\n<p>With so many companies using React JS, including some of the top brands in the whole world, React must be offering some extraordinary benefits, right?</p>\r\n<p>Of course, it does.</p>\r\n<p>The better question is&hellip;</p>\r\n<p>What are the key benefits of React JS that encouraged so many businesses and popular brands to use it?&nbsp;</p>\r\n<h2 id=\"key-benefits-of-react-js-for-front-end-development\">Key Benefits of React JS for Front-end Development</h2>\r\n<p>React JS offers tons of benefits. Let&rsquo;s see the key benefits of React JS to understand why it stands out from other front-end JavaScript development frameworks.</p>\r\n<h3>Speed</h3>\r\n<p>React basically allows developers to utilize individual parts of their application on both the&nbsp;<a href=\"https://www.cloudflare.com/learning/serverless/glossary/client-side-vs-server-side/\" target=\"_blank\" rel=\"nofollow\">client-side and the server-side</a>, which ultimately boosts the speed of the development process.</p>\r\n<p>In simple terms, different developers can write individual parts and all changes made won&rsquo;t cause the logic of the application.</p>\r\n<h3>Flexibility</h3>\r\n<p>Compared to other frontend frameworks, the React code is easier to maintain and is flexible due to its modular structure. This flexibility, in turn, saves a huge amount of time and cost for businesses.</p>\r\n<h3>Performance</h3>\r\n<p>React JS was designed to provide high performance in mind. The core of the framework offers a virtual DOM program and server-side rendering, which makes complex apps run extremely fast.</p>\r\n<blockquote>\r\n<p>Read More:&nbsp;<a href=\"https://www.peerbits.com/blog/top-performance-optimization-tips-for-react.html\" target=\"_blank\">Top Tips to Optimize React Performance</a></p>\r\n</blockquote>\r\n<h3>Usability</h3>\r\n<p>Deploying React is fairly easy to accomplish if you have some basic knowledge of JavaScript.</p>\r\n<p>In fact, an&nbsp;<a href=\"https://www.thinkodc.com/hire-javascript-developers\" target=\"_blank\" rel=\"dofollow\">expert JavaScript developer</a>&nbsp;can easily learn all the ins and outs of the React framework in a matter of a day or two.</p>\r\n<h3>Reusable Components</h3>\r\n<p>One of the main benefits of using React JS is its potential to reuse components. It saves time for developers as they don&rsquo;t have to write various codes for the same features. Furthermore, if any changes are made in any particular part, it will not affect other parts of the application.</p>\r\n<h3>Mobile app development</h3>\r\n<p>If you thought React is for web development only, you could not be more wrong! Facebook has already upgraded the framework for developing mobile native applications for both Android &amp; iOS platforms.</p>\r\n<p>So, now that you know the key benefits of the React framework, let&rsquo;s move forward and also check out the top reasons to Choose React JS for your next project.</p>', 3, 1, 1, '2023-12-27 00:42:18', '2023-12-27 15:31:29'),
(3, 3, '9 Benefits of Using Bootstrap for Landing Pages', '9-benefits-of-using-bootstrap-for-landing-pages', '9-benefits-of-using-bootstrap-for-landing-pages-2023-12-27-658be76772811.jfif', '<p>There are many landing page platforms to help you create landing pages for your business, including&nbsp;<a class=\"external\" href=\"https://startbootstrap.com/template-categories/landing-pages/\" target=\"_blank\" rel=\"noopener\">Bootstrap</a>. With Bootstrap, you can access free themes and templates to design landing pages for your business.</p>\r\n<p>Not sure if Bootstrap is right for your business?</p>\r\n<p>On this page, we&rsquo;ll discuss the nine benefits of using Bootstrap to build your landing pages. If you need help building customized landing pages for your business, call us today at&nbsp;<a href=\"tel:+18882569448\" target=\"_blank\" rel=\"noopener\"><strong>888-256-9448&nbsp;</strong></a>to speak with a strategist.</p>\r\n<h2 id=\"619d30d9a6c31-0\">What is Bootstrap?</h2>\r\n<p>Bootstrap is a front-end framework program for building websites and landing pages. In other words, it allows businesses to quickly and easily create landing pages.</p>\r\n<p>It uses HTML- and CSS-based design templates to help you create your website or landing pages. Bootstrap has pre-programmed features you can customize like typography, forms, buttons, tables, and your navigation bar. All these pre-programmed features save you time from having to write CSS code for each of these elements.</p>\r\n<p>When you save time on coding, you will spend more time designing your website or landing pages. Best of all, this program is completely free to use. This makes it a great option for your business.</p>\r\n<h2 id=\"619d30d9a6c31-1\">9 reasons why you should use Bootstrap for landing pages</h2>\r\n<p>Bootstrap offers numerous benefits for your business. Here are nine benefits to using Bootstrap to build landing pages for your campaign.</p>\r\n<h4 id=\"619d30d9a6c31-2\">1. It makes coding a breeze</h4>\r\n<p>If you don&rsquo;t have a background in web development, coding is a challenging task. However, programs like Bootstrap make the coding process easier.</p>\r\n<p>Since this program does most of the work for you, all you need is a little experience with HTML and CSS. It&rsquo;s a great opportunity to get the benefit of having a customized landing page without extensive coding training.</p>\r\n<h4 id=\"619d30d9a6c31-3\">2. It has customizable page elements</h4>\r\n<p>One of the best features on Bootstrap is that it allows you to customize templates. When you build landing pages, you decide on the&nbsp;<a href=\"https://www.webfx.com/blog/web-design/web-designs-typography/\" target=\"_blank\" rel=\"noopener\">typography</a>, code, buttons, forms, tables, labels, and other features that work best for your business.</p>\r\n<p>Customization is an important part of building a landing page because you want your page to stand out from the competition. If your landing page looks like 100 other pages, your audience won&rsquo;t remember your business. However, customized landing pages create memorable experiences for your audience.</p>\r\n<h4 id=\"619d30d9a6c31-4\">3. It incorporates responsive design elements</h4>\r\n<p>Bootstrap offers responsive design features to allow your landing pages to display well no matter the device someone uses to access them.</p>\r\n<ul>\r\n<li><strong>Responsive design</strong></li>\r\n</ul>\r\n<p>Bootstrap automatically incorporates&nbsp;<a href=\"https://www.webfx.com/web-design/services/responsive-web-design/\">responsive design</a>&nbsp;into your landing pages. This means that your landing pages will adapt to the device someone uses to access your site.</p>\r\n<p>A responsive design ensures that visitors have the best possible experience on your site.</p>\r\n<ul>\r\n<li><strong>Responsive images</strong></li>\r\n</ul>\r\n<p>When you include images on an ordinary page, you may be worried about how they will look on different devices. If you have large images, there&rsquo;s always a chance that they won&rsquo;t scale correctly on smaller screens.</p>\r\n<p>With Bootstrap, there is already code incorporated to resize images based on screen size automatically. This ensures that your images look great, regardless of the device someone uses to access your site.</p>\r\n<h4 id=\"619d30d9a6c31-5\">4. It allows you to create pages quickly</h4>\r\n<p>Bootstrap makes it easy to develop and launch a landing page quickly.</p>\r\n<p>With this program, you can use ready-made coding blocks to help set up your pages. It also offers CSS-Less functionality and cross-browser compatibility. This means you save time on coding, which allows you to build a landing page faster.</p>\r\n<p>Bootstrap also offers ready-made themes that you can purchase. This is an even quicker way to build your site, as you just need to customize these to fit your brand.</p>\r\n<h4 id=\"619d30d9a6c31-6\">5. It allows you to add visual components</h4>\r\n<p>Successful landing pages include engaging visuals that capture that attention of visitors and encourage them to learn more. Bootstrap allows you to create visually appealing landing pages that resonate with your audience.</p>\r\n<p>For example, you can add elements like&nbsp;<a href=\"https://www.webfx.com/blog/web-design/ux-navigation-design/\" target=\"_blank\" rel=\"noopener\">navigation menus</a>, thumbnails, drop-down menus, and more. This is a great way to add eye-catching elements to your site quickly and easily.</p>\r\n<p>The best part is that these elements are responsive, so they will look good no matter the device someone uses to view them.</p>\r\n<h4 id=\"619d30d9a6c31-7\">6. It focuses on the user</h4>\r\n<p>When you create landing pages, you should keep your audience in mind. A landing page that&rsquo;s interesting and engaging will earn more visits and conversions. With Bootstrap, you can develop landing pages that fit your audience&rsquo;s needs.</p>\r\n<p>When you use Bootstrap, it will suggest elements that work best for your audience. These can be things like photos,&nbsp;<a href=\"https://www.webfx.com/blog/marketing/call-to-action-examples/\" target=\"_blank\" rel=\"noopener\">calls to action (CTAs)</a>, or other elements that help you focus on providing a great user experience.</p>\r\n<p>Even as your target audience&rsquo;s needs change, Bootstrap makes it easy to adjust elements on your landing pages to better reach them.</p>\r\n<h4 id=\"619d30d9a6c31-8\">7. It provides you with support</h4>\r\n<p>If you aren&rsquo;t a coding expert, you may feel hesitant about using Bootstrap. Even though it only requires basic knowledge, there&rsquo;s a chance you may run into problems or not know how to fix issues.</p>\r\n<p>Bootstrap has a big support community to help you with issues. There&rsquo;s a good chance they&rsquo;ve had the same problem, too! If you have a problem, you can share it with the community, and they will help you solve it.</p>\r\n<p>Also, the creators are constantly updating Bootstrap for users. They continually work to make a better experience for your business. You&rsquo;ll always have the best version of Bootstrap and access to the assistance you need.</p>\r\n<h4 id=\"619d30d9a6c31-9\">8. It has a mobile-first approach</h4>\r\n<p>As mobile use increases and search engines put more emphasis on mobile-friendliness, it&rsquo;s extremely important to ensure that your landing pages are mobile-friendly.</p>\r\n<p>Bootstrap uses a mobile-first approach. In other words, they optimize pages for mobile devices to ensure that every mobile user has a good experience on their site. This is crucial when choosing a landing page builder.</p>\r\n<p>As stated previously, Bootstrap already incorporates a responsive design for your landing page. This is just one of the many features that helps your landing page remain mobile-friendly.</p>\r\n<h4 id=\"619d30d9a6c31-10\">9. It&rsquo;s compatible with numerous browsers</h4>\r\n<p>Your audience uses numerous devices to view your landing page. This means that they use different browsers, too. It&rsquo;s significant that your landing page is compatible with different web browsers.</p>\r\n<p>With Bootstrap, you will feel confident that your landing pages will display correctly across multiple browsers. Bootstrap pages are compatible with Firefox, Chrome, Edge, Internet Explorer, and Safari. No matter the web browser your audience uses, they will experience your landing page the same.</p>', 0, 1, 1, '2023-12-27 16:59:19', '2023-12-27 17:02:19'),
(4, 8, 'What is Node.js (Node)?', 'what-is-nodejs-node', 'what-is-nodejs-node-2023-12-27-658c4835772ab.jfif', '<h2 class=\"section-title\">What is Node.js (Node)?</h2>\r\n<p>Node.js (Node) is an Open Source, cross-platform runtime environment for executing&nbsp;<a href=\"https://www.theserverside.com/definition/JavaScript\">JavaScript</a>&nbsp;code. Node is used extensively for server-side programming, making it possible for developers to use JavaScript for&nbsp;<a href=\"https://www.techtarget.com/searchapparchitecture/definition/client-side-framework\">client-side</a>&nbsp;and server-side code without needing to learn an additional language. Node is sometimes referred to as a programming language or&nbsp;<a href=\"https://www.techtarget.com/whatis/definition/software-development\">software development</a>&nbsp;framework, but neither is true; it is strictly a JavaScript&nbsp;<a href=\"https://www.techtarget.com/searchsoftwarequality/definition/runtime\">runtime</a>.</p>\r\n<p>Node incorporates the V8 JavaScript engine, the same one used in&nbsp;<a href=\"https://www.techtarget.com/searchmobilecomputing/definition/Google-Chrome-browser\">Google Chrome</a>&nbsp;and other browsers. It is written in&nbsp;<a href=\"https://www.techtarget.com/searchdatamanagement/definition/C\">C++</a>&nbsp;and can run on macOS, Linux, Windows and other systems. The engine parses and executes JavaScript code. It can operate independently of a browser environment, either embedded in a C++ application or implemented as a standalone program. The V8 engine compiles JavaScript internally, using just-in-time (<a href=\"https://www.theserverside.com/definition/just-in-time-compiler-JIT\">JIT</a>) processes to speed up execution.</p>\r\n<p>The following code is an example of a simple JavaScript file (server_tst.js) written for the Node environment. The script starts by loading the Node.js Hypertext Transfer Protocol (<a href=\"https://www.techtarget.com/whatis/definition/HTTP-Hypertext-Transfer-Protocol\">HTTP</a>) module. The module includes a variety of classes and methods for implementing an HTTP server.</p>\r\n<section class=\"section main-article-chapter\" data-menu-title=\"What is Node.js (Node)?\">\r\n<p>After Node.js is installed on a computer, the file can be run using a simple command: node server_tst.js. The JavaScript code instructs Node to carry out two basic operations:</p>\r\n<ul class=\"default-list\">\r\n<li>Display a message in a browser on the local machine when connecting to http://localhost:2000. The message reads, \"This is a test of Node.js on a local computer.\"</li>\r\n<li>Return a message to the console when the command is run. The message states, \"Node.js server running at http://127.0.0.1:2000/.\"</li>\r\n</ul>\r\n<p>More details about the components in this script and the HTTP module in general can be found by referring to the HTTP topic in the official API reference documentation published by the Node.js organization.</p>\r\n</section>\r\n<section class=\"section main-article-chapter\" data-menu-title=\"How does Node.js work?\">\r\n<h2 class=\"section-title\">How does Node.js work?</h2>\r\n<p>A Node application runs in a single process. Node does not create a new&nbsp;<a href=\"https://www.techtarget.com/whatis/definition/thread\">thread</a>&nbsp;for every request, as is often the case with traditional server-side programs. In this way, a Node server can handle thousands of concurrent connections without having to contend with thread concurrency issues or the overhead&nbsp;<a href=\"https://www.techtarget.com/whatis/definition/multithreading\">multithreading</a>&nbsp;brings.</p>\r\n<p>Node.js is&nbsp;<a href=\"https://www.techtarget.com/searchitoperations/definition/event-driven-application\">event-driven</a>&nbsp;and runs asynchronously. Code written for the Node environment does not follow the traditional model of receive, process, send, wait and receive found in other systems. Instead, Node implements an event loop that processes incoming requests as they stack up in the event queue, handling small requests one after the other without waiting for responses.</p>\r\n<p>This is a shift away from mainstream models that run larger, more complex operations and process several threads concurrently, with each thread waiting for its appropriate response before moving on.</p>\r\n<p>The Node.js approach offers a major advantage over these models, according to its creator Ryan Dahl. Node does not block input/output (<a href=\"https://www.techtarget.com/whatis/definition/input-output-I-O\">I/O</a>) operations like more traditional approaches. This is in large part because Node functions do not perform I/O directly, which helps eliminate the potential for blocking. Blocking occurs only when using synchronous methods in the standard Node library, but that is the exception rather than the rule, making Node well suited for real-time applications with heavy concurrent workloads.</p>\r\n<p>Node also ships with the&nbsp;<a href=\"https://nodejs.org/en/knowledge/getting-started/npm/what-is-npm/\">npm</a>&nbsp;command-line interface (<a href=\"https://www.techtarget.com/searchwindowsserver/definition/command-line-interface-CLI\">CLI</a>). The CLI is part of the npm package management system, which includes an extensive registry of JavaScript software and its meta information. The CLI lets users interact with npm packages in the registry directly from their consoles. The registry is reportedly the largest single language code repository in the world.</p>\r\n<p>Like JavaScript, Node is considered relatively easy to learn. It is widely implemented and has a large, active user community behind it. In addition, because Node is asynchronous, event-driven and non-blocking, it can handle the type of real-time concurrency common in many of today\'s&nbsp;<a href=\"https://www.techtarget.com/searchsoftwarequality/definition/Web-application-Web-app\">web applications</a>&nbsp;and online services. Node is well suited to real-time applications such as chats, streaming services, internet of things (<a href=\"https://www.techtarget.com/iotagenda/definition/Internet-of-Things-IoT\">IoT</a>) offerings or&nbsp;<a href=\"https://www.techtarget.com/whatis/definition/single-page-application-SPA\">single-page applications</a>.</p>\r\n<p>Node is not suited to every type of workload, however. For example, because of its single-threaded nature, Node might not be able to effectively run a processor-intensive web application that requires heavy server-side computations. The computational load could end up blocking incoming requests and degrading overall performance.</p>\r\n<p>On the other hand, if Node appears to meet your needs in all other respects and the computational load is not too excessive, you might be able to implement that load as background processes in another language. Node can also be used as part of a&nbsp;<a href=\"https://www.techtarget.com/whatis/definition/microservice-architecture-MSA\">microservices architecture</a>&nbsp;that breaks the application into smaller parts.</p>\r\n</section>', 0, 1, 1, '2023-12-27 23:52:21', '2023-12-28 00:25:04'),
(5, 9, 'The PHP Framework for Web Artisans', 'the-php-framework-for-web-artisans', 'the-php-framework-for-web-artisans-2023-12-27-658c4a49503ea.jpg', '<p>Laravel is a web application framework with expressive, elegant syntax. A web framework provides a structure and starting point for creating your application, allowing you to focus on creating something amazing while we sweat the details.</p>\r\n<p>Laravel strives to provide an amazing developer experience while providing powerful features such as thorough dependency injection, an expressive database abstraction layer, queues and scheduled jobs, unit and integration testing, and more.</p>\r\n<p>Whether you are new to PHP web frameworks or have years of experience, Laravel is a framework that can grow with you. We\'ll help you take your first steps as a web developer or give you a boost as you take your expertise to the next level. We can\'t wait to see what you build.</p>\r\n<blockquote>\r\n<div class=\"mb-10 max-w-2xl mx-auto px-4 py-8 shadow-lg lg:flex lg:items-center callout\">\r\n<div class=\"w-20 h-20 mb-6 flex items-center justify-center shrink-0 bg-purple-600 lg:mb-0\"><img class=\"opacity-75\" src=\"https://laravel.com/img/callouts/lightbulb.min.svg\" /></div>\r\n<p class=\"mb-0 lg:ml-6\">New to Laravel? Check out the&nbsp;<a href=\"https://bootcamp.laravel.com/\">Laravel Bootcamp</a>&nbsp;for a hands-on tour of the framework while we walk you through building your first Laravel application.</p>\r\n</div>\r\n</blockquote>\r\n<p>&nbsp;</p>\r\n<h3 id=\"why-laravel\"><a href=\"https://laravel.com/docs/10.x#why-laravel\">Why Laravel?</a></h3>\r\n<p>There are a variety of tools and frameworks available to you when building a web application. However, we believe Laravel is the best choice for building modern, full-stack web applications.</p>\r\n<h4>A Progressive Framework</h4>\r\n<p>We like to call Laravel a \"progressive\" framework. By that, we mean that Laravel grows with you. If you\'re just taking your first steps into web development, Laravel\'s vast library of documentation, guides, and&nbsp;<a href=\"https://laracasts.com/\">video tutorials</a>&nbsp;will help you learn the ropes without becoming overwhelmed.</p>\r\n<p>If you\'re a senior developer, Laravel gives you robust tools for&nbsp;<a href=\"https://laravel.com/docs/10.x/container\">dependency injection</a>,&nbsp;<a href=\"https://laravel.com/docs/10.x/testing\">unit testing</a>,&nbsp;<a href=\"https://laravel.com/docs/10.x/queues\">queues</a>,&nbsp;<a href=\"https://laravel.com/docs/10.x/broadcasting\">real-time events</a>, and more. Laravel is fine-tuned for building professional web applications and ready to handle enterprise work loads.</p>\r\n<h4>A Scalable Framework</h4>\r\n<p>Laravel is incredibly scalable. Thanks to the scaling-friendly nature of PHP and Laravel\'s built-in support for fast, distributed cache systems like Redis, horizontal scaling with Laravel is a breeze. In fact, Laravel applications have been easily scaled to handle hundreds of millions of requests per month.</p>\r\n<p>Need extreme scaling? Platforms like&nbsp;<a href=\"https://vapor.laravel.com/\">Laravel Vapor</a>&nbsp;allow you to run your Laravel application at nearly limitless scale on AWS\'s latest serverless technology.</p>\r\n<h4>A Community Framework</h4>\r\n<p>Laravel combines the best packages in the PHP ecosystem to offer the most robust and developer friendly framework available. In addition, thousands of talented developers from around the world have&nbsp;<a href=\"https://github.com/laravel/framework\">contributed to the framework</a>. Who knows, maybe you\'ll even become a Laravel contributor.</p>\r\n<p>&nbsp;</p>\r\n<h2 id=\"creating-a-laravel-project\"><a href=\"https://laravel.com/docs/10.x#creating-a-laravel-project\">Creating A Laravel Project</a></h2>\r\n<p>Before creating your first Laravel project, make sure that your local machine has PHP and&nbsp;<a href=\"https://getcomposer.org/\">Composer</a>&nbsp;installed. If you are developing on macOS, PHP and Composer can be installed in minutes via&nbsp;<a href=\"https://herd.laravel.com/\">Laravel Herd</a>. In addition, we recommend&nbsp;<a href=\"https://nodejs.org/\">installing Node and NPM</a>.</p>\r\n<p>After you have installed PHP and Composer, you may create a new Laravel project via Composer\'s&nbsp;<code>create-project</code>&nbsp;command:</p>\r\n<div class=\"relative code-block-wrapper\">\r\n<div class=\"line\">composer create-project laravel/laravel example-app</div>\r\n<button id=\"clipButton-0\" class=\"md:block hidden copyBtn\" title=\"Copy to Clipboard\" data-clipboard-target=\"#clipText-0\"></button></div>\r\n<p>Once the project has been created, start Laravel\'s local development server using Laravel Artisan\'s&nbsp;<code>serve</code>&nbsp;command:</p>\r\n<div class=\"relative code-block-wrapper\">\r\n<div class=\"line\">cd example-app</div>\r\n<div class=\"line\">&nbsp;</div>\r\n<div class=\"line\">php artisan serve</div>\r\n<button id=\"clipButton-1\" class=\"md:block hidden copyBtn\" title=\"Copy to Clipboard\" data-clipboard-target=\"#clipText-1\"></button></div>\r\n<p>Once you have started the Artisan development server, your application will be accessible in your web browser at&nbsp;<a href=\"http://localhost:8000/\">http://localhost:8000</a>. Next, you\'re ready to&nbsp;<a href=\"https://laravel.com/docs/10.x#next-steps\">start taking your next steps into the Laravel ecosystem</a>. Of course, you may also want to&nbsp;<a href=\"https://laravel.com/docs/10.x#databases-and-migrations\">configure a database</a>.</p>\r\n<blockquote>\r\n<div class=\"mb-10 max-w-2xl mx-auto px-4 py-8 shadow-lg lg:flex lg:items-center callout\">\r\n<div class=\"w-20 h-20 mb-6 flex items-center justify-center shrink-0 bg-purple-600 lg:mb-0\"><img class=\"opacity-75\" src=\"https://laravel.com/img/callouts/lightbulb.min.svg\" /></div>\r\n<p class=\"mb-0 lg:ml-6\">If you would like a head start when developing your Laravel application, consider using one of our&nbsp;<a href=\"https://laravel.com/docs/10.x/starter-kits\">starter kits</a>. Laravel\'s starter kits provide backend and frontend authentication scaffolding for your new Laravel application.</p>\r\n</div>\r\n</blockquote>\r\n<p>&nbsp;</p>\r\n<h2 id=\"initial-configuration\"><a href=\"https://laravel.com/docs/10.x#initial-configuration\">Initial Configuration</a></h2>\r\n<p>All of the configuration files for the Laravel framework are stored in the&nbsp;<code>config</code>&nbsp;directory. Each option is documented, so feel free to look through the files and get familiar with the options available to you.</p>\r\n<p>Laravel needs almost no additional configuration out of the box. You are free to get started developing! However, you may wish to review the&nbsp;<code>config/app.php</code>&nbsp;file and its documentation. It contains several options such as&nbsp;<code>timezone</code>&nbsp;and&nbsp;<code>locale</code>&nbsp;that you may wish to change according to your application.</p>\r\n<p>&nbsp;</p>\r\n<h3 id=\"environment-based-configuration\"><a href=\"https://laravel.com/docs/10.x#environment-based-configuration\">Environment Based Configuration</a></h3>\r\n<p>Since many of Laravel\'s configuration option values may vary depending on whether your application is running on your local machine or on a production web server, many important configuration values are defined using the&nbsp;<code>.env</code>&nbsp;file that exists at the root of your application.</p>\r\n<p>Your&nbsp;<code>.env</code>&nbsp;file should not be committed to your application\'s source control, since each developer / server using your application could require a different environment configuration. Furthermore, this would be a security risk in the event an intruder gains access to your source control repository, since any sensitive credentials would get exposed.</p>\r\n<blockquote>\r\n<div class=\"mb-10 max-w-2xl mx-auto px-4 py-8 shadow-lg lg:flex lg:items-center callout\">\r\n<div class=\"w-20 h-20 mb-6 flex items-center justify-center shrink-0 bg-purple-600 lg:mb-0\"><img class=\"opacity-75\" src=\"https://laravel.com/img/callouts/lightbulb.min.svg\" /></div>\r\n<p class=\"mb-0 lg:ml-6\">For more information about the&nbsp;<code>.env</code>&nbsp;file and environment based configuration, check out the full&nbsp;<a href=\"https://laravel.com/docs/10.x/configuration#environment-configuration\">configuration documentation</a>.</p>\r\n</div>\r\n</blockquote>\r\n<p>&nbsp;</p>\r\n<h3 id=\"databases-and-migrations\"><a href=\"https://laravel.com/docs/10.x#databases-and-migrations\">Databases &amp; Migrations</a></h3>\r\n<p>Now that you have created your Laravel application, you probably want to store some data in a database. By default, your application\'s&nbsp;<code>.env</code>&nbsp;configuration file specifies that Laravel will be interacting with a MySQL database and will access the database at&nbsp;<code>127.0.0.1</code>.</p>\r\n<blockquote>\r\n<div class=\"mb-10 max-w-2xl mx-auto px-4 py-8 shadow-lg lg:flex lg:items-center callout\">\r\n<div class=\"w-20 h-20 mb-6 flex items-center justify-center shrink-0 bg-purple-600 lg:mb-0\"><img class=\"opacity-75\" src=\"https://laravel.com/img/callouts/lightbulb.min.svg\" /></div>\r\n<p class=\"mb-0 lg:ml-6\">If you are developing on macOS and need to install MySQL, Postgres, or Redis locally, consider using&nbsp;<a href=\"https://dbngin.com/\">DBngin</a>.</p>\r\n</div>\r\n</blockquote>\r\n<p>If you do not want to install MySQL or Postgres on your local machine, you can always use a&nbsp;<a href=\"https://www.sqlite.org/index.html\">SQLite</a>&nbsp;database. SQLite is a small, fast, self-contained database engine. To get started, update your&nbsp;<code>.env</code>&nbsp;configuration file to use Laravel\'s&nbsp;<code>sqlite</code>&nbsp;database driver. You may remove the other database configuration options:</p>\r\n<div class=\"relative code-block-wrapper\">\r\n<div class=\"line line-add line-has-background\">DB_CONNECTION=sqlite</div>\r\n<div class=\"line line-remove line-has-background\">DB_CONNECTION=mysql</div>\r\n<div class=\"line line-remove line-has-background\">DB_HOST=127.0.0.1</div>\r\n<div class=\"line line-remove line-has-background\">DB_PORT=3306</div>\r\n<div class=\"line line-remove line-has-background\">DB_DATABASE=laravel</div>\r\n<div class=\"line line-remove line-has-background\">DB_USERNAME=root</div>\r\n<div class=\"line line-remove line-has-background\">DB_PASSWORD=</div>\r\n<button id=\"clipButton-2\" class=\"md:block hidden copyBtn\" title=\"Copy to Clipboard\" data-clipboard-target=\"#clipText-2\"></button></div>\r\n<p>Once you have configured your SQLite database, you may run your application\'s&nbsp;<a href=\"https://laravel.com/docs/10.x/migrations\">database migrations</a>, which will create your application\'s database tables:</p>\r\n<div class=\"relative code-block-wrapper\">\r\n<div class=\"line\">php artisan migrate</div>\r\n<button id=\"clipButton-3\" class=\"md:block hidden copyBtn\" title=\"Copy to Clipboard\" data-clipboard-target=\"#clipText-3\"></button></div>\r\n<p>If an SQLite database does not exist for your application, Laravel will ask you if you would like the database to be created. Typically, the SQLite database file will be created at&nbsp;<code>database/database.sqlite</code>.</p>\r\n<p>&nbsp;</p>\r\n<h3 id=\"directory-configuration\"><a href=\"https://laravel.com/docs/10.x#directory-configuration\">Directory Configuration</a></h3>\r\n<p>Laravel should always be served out of the root of the \"web directory\" configured for your web server. You should not attempt to serve a Laravel application out of a subdirectory of the \"web directory\". Attempting to do so could expose sensitive files present within your application.</p>\r\n<p>&nbsp;</p>\r\n<h2 id=\"docker-installation-using-sail\"><a href=\"https://laravel.com/docs/10.x#docker-installation-using-sail\">Docker Installation Using Sail</a></h2>\r\n<p>We want it to be as easy as possible to get started with Laravel regardless of your preferred operating system. So, there are a variety of options for developing and running a Laravel project on your local machine. While you may wish to explore these options at a later time, Laravel provides&nbsp;<a href=\"https://laravel.com/docs/10.x/sail\">Sail</a>, a built-in solution for running your Laravel project using&nbsp;<a href=\"https://www.docker.com/\">Docker</a>.</p>\r\n<p>Docker is a tool for running applications and services in small, light-weight \"containers\" which do not interfere with your local machine\'s installed software or configuration. This means you don\'t have to worry about configuring or setting up complicated development tools such as web servers and databases on your local machine. To get started, you only need to install&nbsp;<a href=\"https://www.docker.com/products/docker-desktop\">Docker Desktop</a>.</p>\r\n<p>Laravel Sail is a light-weight command-line interface for interacting with Laravel\'s default Docker configuration. Sail provides a great starting point for building a Laravel application using PHP, MySQL, and Redis without requiring prior Docker experience.</p>', 0, 1, 1, '2023-12-28 00:01:13', '2023-12-28 00:25:21'),
(6, 9, 'HTML Document Structure Before And After HTML5 – Here’s What Changed', 'html-document-structure-before-and-after-html5-heres-what-changed', 'html-document-structure-before-and-after-html5-heres-what-changed-2023-12-27-658c4b1354964.jpg', '<p>If you want to write semantic markup &ndash; and believe us,&nbsp;<a href=\"https://html.com/semantic-markup/\">you do want to write semantic markup</a>&nbsp;&ndash; then you need to structure HTML documents properly. The&nbsp;<code>html</code>,&nbsp;<code>head</code>, and&nbsp;<code>body</code>&nbsp;elements have been part of the HTML specification since the mid 1990s, and up until a few years ago they were the primary elements used to give structure to HTML documents. However, the situation has changed dramatically in the last few years as HTML5 has added a slew of new tags that can be used to add rich semantic meaning to the structure of an HTML document.<br /><br />Read more:&nbsp;<a href=\"https://html.com/document/#ixzz8N6sSPiwm\">https://html.com/document/#ixzz8N6sSPiwm</a></p>\r\n<h2><span id=\"HTML_Document_Structure_Before_HTML5\">HTML Document Structure Before HTML5</span></h2>\r\n<p>If you&rsquo;ve been using HTML for any time at all you know that every bit of HTML needs to be wrapped in&nbsp;<a href=\"https://html.com/tags/html/\"><code>html</code></a>&nbsp;tags. An opening&nbsp;<code>&lt;html&gt;</code>&nbsp;tag should appear first and a closing&nbsp;<code>&lt;/html&gt;</code>&nbsp;tag should appear at the bottom of the document. Every other bit of HTML should appear between those two tags.</p>\r\n<p>The&nbsp;<a href=\"https://html.com/tags/head/\"><code>head</code></a>&nbsp;element is the first element to appear after the opening&nbsp;<code>html</code>&nbsp;tag. In the document&nbsp;<code>head</code>&nbsp;we place things like the page&nbsp;<a href=\"https://html.com/tags/title/\"><code>title</code></a>&nbsp;and&nbsp;<a href=\"https://html.com/tags/meta/\"><code>meta</code></a>&nbsp;data, we add JavaScript to our page with the&nbsp;<a href=\"https://html.com/tags/script/\"><code>script</code></a>&nbsp;tag, and we [<code>link</code>] to external stylesheets and other resources.</p>\r\n<p>On most webpages the&nbsp;<code>head</code>&nbsp;element is a very busy place. For this reason,&nbsp;<a href=\"https://html.com/document/metadata/\">we&rsquo;ve created a tutorial</a>&nbsp;that explains the tags that typically appear in the&nbsp;<code>head</code>&nbsp;element and what these tags are used for.</p>\r\n<p>All of the content that is visible on a web page is nested between opening and closing&nbsp;<a href=\"https://html.com/tags/body/\"><code>body</code></a>&nbsp;tags. The body is the primary container of the content that makes up a web page.</p>\r\n<p>Up until HTML5, that was pretty much it for basic HTML document structure. All of our code was dropped in between the&nbsp;<code>body</code>&nbsp;tags and styled with&nbsp;<a href=\"https://html.com/css/\">CSS</a>. However, now that HTML5 has broad support among modern browsers, it&rsquo;s time to implement the new HTML5 tags that will give our HTML documents a much more meaningful structure.</p>\r\n<h2><span id=\"New_Semantic_Tags_Added_by_HTML5\">New Semantic Tags Added by HTML5</span></h2>\r\n<p>In this brief tutorial we&rsquo;ll touch on all of the new tags added as part of HTML5 to define the structure and content of a web page. The elements we&rsquo;re going to cover in this guide include:</p>\r\n<ul>\r\n<li><a href=\"https://html.com/tags/header/\"><code>header</code></a></li>\r\n<li><a href=\"https://html.com/tags/main/\"><code>main</code></a></li>\r\n<li><a href=\"https://html.com/tags/nav/\"><code>nav</code></a></li>\r\n<li><a href=\"https://html.com/tags/article/\"><code>article</code></a></li>\r\n<li><a href=\"https://html.com/tags/section/\"><code>section</code></a></li>\r\n<li><a href=\"https://html.com/tags/aside/\"><code>aside</code></a></li>\r\n<li><a href=\"https://html.com/tags/address/\"><code>address</code></a></li>\r\n<li><a href=\"https://html.com/tags/footer/\"><code>footer</code></a></li>\r\n</ul>\r\n<p>Using these elements isn&rsquo;t as complicated as it might appear at first glance, and most are fairly self-explanatory. We&rsquo;ll make a quick pass over each new element, and then draw up an HTML template you can use these new tags to add rich semantic meaning to your markup.</p>\r\n<h3><span id=\"ltheadergt\"><code>&lt;header&gt;</code></span></h3>\r\n<p>The&nbsp;<code>header</code>&nbsp;element is used to contain the content that appears at the top of every page of your website: the logo, tagline, search prompt, and possibly a navigational menu. In most cases, the&nbsp;<code>header</code>&nbsp;element is best positioned as a direct descendant of the&nbsp;<code>body</code>&nbsp;element, but it&rsquo;s also ok to place it inside the&nbsp;<code>main</code>&nbsp;element if you prefer.</p>\r\n<h3><span id=\"ltmaingt\"><code>&lt;main&gt;</code></span></h3>\r\n<p>Use the&nbsp;<code>main</code>&nbsp;element between&nbsp;<code>header</code>&nbsp;and&nbsp;<code>footer</code>&nbsp;elements to contain the primary content of your web page. The&nbsp;<code>main</code>&nbsp;element&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/HTML/Element/main\">cannot be a descendant</a>&nbsp;of an&nbsp;<code>article</code>,&nbsp;<code>aside</code>,&nbsp;<code>header</code>,&nbsp;<code>footer</code>, or&nbsp;<code>nav</code>&nbsp;element. Instead, it should be a direct descendant of the&nbsp;<code>body</code>&nbsp;element. Think of it as the direct replacement for the&nbsp;<code>div id=\"main\"</code>&nbsp;you&rsquo;ve used in the past to wrap up your entire page contents.</p>\r\n<p>It&rsquo;s also ok to use more than one&nbsp;<code>main</code>&nbsp;element on a webpage. For example, if your blog homepage includes your five most recent posts, it would be appropriate to wrap each post in it&rsquo;s own&nbsp;<code>main</code>&nbsp;element &ndash; or you could wrap each in&nbsp;<a href=\"https://html.com/document/#ltarticlegt\"><code>article</code></a>&nbsp;tags.</p>\r\n<h3><span id=\"ltnavgt\"><code>&lt;nav&gt;</code></span></h3>\r\n<p>Navigational menus are commonly placed at the top of a web page, in a sidebar, or in the page footer. Wherever you happen to place a navigational menu, wrap it in&nbsp;<code>nav</code>&nbsp;tags. Note that you don&rsquo;t need to use&nbsp;<code>nav</code>&nbsp;tags for every link, just for blocks of links that provide either sitewide navigation or navigation for a specific part of a website.</p>\r\n<h3><span id=\"ltarticlegt\"><code>&lt;article&gt;</code></span></h3>\r\n<p>If your website includes blog posts, articles, or any other content that could just as well appear on another website as syndicated content, wrap that content in an&nbsp;<code>article</code>&nbsp;post. You can use an&nbsp;<code>article</code>&nbsp;element just about anywhere other than nested within an&nbsp;<code>address</code>&nbsp;element, but in most cases an&nbsp;<code>article</code>&nbsp;element will be a direct descendant of a&nbsp;<code>main</code>&nbsp;element or of a&nbsp;<code>section</code>&nbsp;element that is a direct descendant of a&nbsp;<code>main</code>&nbsp;element.</p>\r\n<h3><span id=\"ltsectiongt\"><code>&lt;section&gt;</code></span></h3>\r\n<p>The&nbsp;<code>section</code>&nbsp;element is used to identify content that is a major sub-section of a larger whole. For example, if you&rsquo;ve posted a long-form ebook in HTML format, it would be reasonable to wrap each chapter in a&nbsp;<code>section</code>&nbsp;element. Likewise, if you have a sidebar (semantically wrapped in&nbsp;<code>aside</code>&nbsp;tags) that contains four sections &ndash; ads, a search prompt, related posts, and a newsletter signup form &ndash; it would be ok to wrap each of these four sections in&nbsp;<code>section</code>&nbsp;tags since a written outline of the sidebar contents would include a line item for each of the four sections.</p>\r\n<p><a href=\"http://html5doctor.com/the-section-element/\">There is some confusion</a>&nbsp;about when to use a&nbsp;<code>section</code>&nbsp;and when to use a&nbsp;<code>div</code>. Here&rsquo;s a good rule of thumb to help you know when to use each:</p>\r\n<ul>\r\n<li>Use a&nbsp;<code>div</code>&nbsp;if you&rsquo;re wrapping up some content purely to make it easier to style the content or to make it easier for some JavaScript to get ahold of it.</li>\r\n<li>Use a&nbsp;<code>section</code>&nbsp;if you would list the content as an item when writing out an outline of the document.</li>\r\n</ul>\r\n<h3><span id=\"ltasidegt\"><code>&lt;aside&gt;</code></span></h3>\r\n<p>If your website contains information that isn&rsquo;t directly related to the main content of the page, it would be appropriate to wrap that information in&nbsp;<code>aside</code>&nbsp;tags. For example, if you write a post that includes some technical terms, and you add definitions for those terms in a sidebar, it would make sense to wrap those definitions in&nbsp;<code>aside</code>&nbsp;tags. It is also common for the entire sidebar of a blog-type website to be wrapped in&nbsp;<code>aside</code>&nbsp;tags to make it clear that the sidebar is not part of the primary content of the page.</p>\r\n<h3><span id=\"ltaddressgt\"><code>&lt;address&gt;</code></span></h3>\r\n<p>The&nbsp;<code>address</code>&nbsp;element provides contact information for the nearest parent&nbsp;<code>article</code>&nbsp;or&nbsp;<code>body</code>&nbsp;element that contains it. Use the&nbsp;<code>address</code>&nbsp;element inside an&nbsp;<code>article</code>&nbsp;to provide contact information for the article&rsquo;s author. Use it outside of an&nbsp;<code>article</code>&nbsp;in the&nbsp;<code>main</code>&nbsp;or&nbsp;<code>footer</code>&nbsp;elements, or as a direct descendant of the&nbsp;<code>body</code>&nbsp;element, to provide contact information for the website&rsquo;s owner.</p>\r\n<h3><span id=\"ltfootergt\"><code>&lt;footer&gt;</code></span></h3>\r\n<p>The&nbsp;<code>footer</code>&nbsp;appears at the bottom of a section of a document. Typically, the&nbsp;<code>footer</code>&nbsp;is a direct descendant of the&nbsp;<code>body</code>&nbsp;element, but it can also be used within a&nbsp;<code>main</code>&nbsp;element, a&nbsp;<code>section</code>, or an&nbsp;<code>article</code>. The most common use of the&nbsp;<code>footer</code>&nbsp;element is to place it at the bottom of an HTML document to contain things like a copyright notice, links to related content,&nbsp;<code>address</code>&nbsp;information about the owner of the website, and links to administrative things like privacy policies and website&rsquo;s terms of service.</p>\r\n<p>You may also use the&nbsp;<code>footer</code>&nbsp;element within an&nbsp;<code>article</code>&nbsp;to provide metadata about that particular article. For example, if&nbsp;<code>article</code>&nbsp;tags have been used to wrap a forum post, it would be appropriate to wrap copyright information and the date and time the post was made in a&nbsp;<code>footer</code>&nbsp;element and place it at the bottom of the&nbsp;<code>article</code>.</p>\r\n<h2><span id=\"An_HTML_Document_Template\">An HTML Document Template</span></h2>\r\n<p>The template below will show you how all of these elements are properly nested together. We invite you to copy it and use it as a boilerplate template for all of your HTML documents.</p>\r\n<pre><code class=\"html\">&lt;html&gt;\r\n  &lt;!--Only the head and body elements are supposed to be direct descendants of the \r\n  html element. All others should be descendants of either the head or body--&gt;\r\n  &lt;head&gt;\r\n    &lt;!--The head element must be a direct descendant of the html element--&gt;\r\n    &lt;!--The head element is a very busy place for most websites, so we\'ve created\r\n    a tutorial to walk you through the different elements and tasks accomplished\r\n    in the head element. You can find it at the following address:\r\n    https://html.com/document/metadata/ --&gt;\r\n    &lt;title&gt;Your Webpage Title Goes Here&lt;/title&gt;\r\n  &lt;/head&gt;\r\n  &lt;body&gt;\r\n    &lt;!--The body element contains the full visible content of the web page--&gt;\r\n    &lt;header&gt;\r\n      &lt;!--The header typically includes your logo, tagline, and may contain a nav \r\n      element--&gt;\r\n      &lt;nav&gt;\r\n        &lt;!--The nav element isn\'t used for every single link but for navigational \r\n        menus--&gt;\r\n      &lt;/nav&gt;\r\n    &lt;/header&gt;\r\n    &lt;main&gt;\r\n      &lt;!--The main element cannot be used inside of anything other than the body \r\n      element. It is intended to hold the main content of the page.--&gt;\r\n      &lt;nav&gt;\r\n        &lt;!--You can use a nav element just about anywhere--&gt;\r\n      &lt;/nav&gt;\r\n      &lt;article&gt;\r\n        &lt;!--If your web page contains a blog post or news article it makes sense \r\n        to wrap the whole article in article tags--&gt;\r\n        &lt;aside&gt;\r\n          &lt;!--The aside tag can be used within an article or outside of it. It \r\n          is used to mark content that is related but not central to the main \r\n          content of the page--&gt;\r\n        &lt;/aside&gt;\r\n        &lt;section&gt;\r\n          &lt;!--Sections are used to seperate major parts of an element, such as \r\n          chapters of an HTML ebook, or to cordone off the comments section \r\n          from the rest of the main element--&gt;\r\n        &lt;/section&gt;\r\n        &lt;address&gt;\r\n          &lt;!--An address element inside of an article element is used to provide \r\n          contact info for the author of the article--&gt;\r\n        &lt;/address&gt;\r\n      &lt;/article&gt;\r\n      &lt;aside&gt;\r\n        &lt;!--The aside element would also be used to mark a sidebar if used \r\n        outside of the main element--&gt;\r\n        &lt;section&gt;\r\n          &lt;!--Within a sidebar you could use section elements to identify the \r\n          different parts of the sidebar. For example, you could put adds in \r\n          one section, related posts in a second section, and a newsletter \r\n          signup form in a third section element.--&gt;\r\n        &lt;/section&gt;\r\n      &lt;/aside&gt;\r\n    &lt;/main&gt;\r\n    &lt;footer&gt;\r\n      &lt;!--The footer typically contains links to things like About Us, Privacy \r\n      Policy, Contact Us and so forth. It may also contain a nav, address, \r\n      section, or aside element.--&gt;\r\n      &lt;address&gt;\r\n        &lt;!--Put an address element in the footer and you\'re indicating that \r\n        the contact info within the element is for the owner of the website \r\n        rather than the author of the article.--&gt;\r\n      &lt;/address&gt;\r\n    &lt;/footer&gt;\r\n  &lt;/body&gt;\r\n&lt;/html&gt;</code></pre>\r\n<p><br /><br />Read more:&nbsp;<a href=\"https://html.com/document/#ixzz8N6sdv44K\">https://html.com/document/#ixzz8N6sdv44K</a></p>', 0, 1, 1, '2023-12-28 00:04:35', '2023-12-28 00:25:42');
INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(7, 9, 'CSS: Cascading Style Sheets', 'css-cascading-style-sheets', 'css-cascading-style-sheets-2023-12-27-658c4c97732f4.jfif', '<div class=\"section-content\">\r\n<p><strong>Cascading Style Sheets</strong>&nbsp;(<strong>CSS</strong>) is a&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/API/StyleSheet\">stylesheet</a>&nbsp;language used to describe the presentation of a document written in&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/HTML\">HTML</a>&nbsp;or&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/XML/XML_introduction\">XML</a>&nbsp;(including XML dialects such as&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/SVG\">SVG</a>,&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/MathML\">MathML</a>&nbsp;or&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Glossary/XHTML\">XHTML</a>). CSS describes how elements should be rendered on screen, on paper, in speech, or on other media.</p>\r\n<p>CSS is among the core languages of the&nbsp;<strong>open web</strong>&nbsp;and is standardized across Web browsers according to&nbsp;<a class=\"external\" href=\"https://www.w3.org/Style/CSS/#specs\" target=\"_blank\">W3C specifications</a>. Previously, the development of various parts of CSS specification was done synchronously, which allowed the versioning of the latest recommendations. You might have heard about CSS1, CSS2.1, or even CSS3. There will never be a CSS3 or a CSS4; rather, everything is now CSS without a version number.</p>\r\n<p>After CSS 2.1, the scope of the specification increased significantly and the progress on different CSS modules started to differ so much, that it became more effective to&nbsp;<a class=\"external\" href=\"https://www.w3.org/Style/CSS/current-work\" target=\"_blank\">develop and release recommendations separately per module</a>. Instead of versioning the CSS specification, W3C now periodically takes a snapshot of&nbsp;<a class=\"external\" href=\"https://www.w3.org/TR/css/\" target=\"_blank\">the latest stable state of the CSS specification</a>&nbsp;and individual modules progress. CSS modules now have version numbers, or levels, such as&nbsp;<a class=\"external\" href=\"https://drafts.csswg.org/css-color-5/\" target=\"_blank\">CSS Color Module Level 5</a>.</p>\r\n</div>\r\n<section>\r\n<h2 id=\"key_resources\"><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS#key_resources\">Key resources</a></h2>\r\n<div class=\"section-content\">\r\n<dl>\r\n<dt id=\"css_introduction\"><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS#css_introduction\">CSS Introduction</a></dt>\r\n<dd>\r\n<p>If you\'re new to web development, be sure to read our&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/CSS_basics\">CSS basics</a>&nbsp;article to learn what CSS is and how to use it.</p>\r\n</dd>\r\n<dt id=\"css_tutorials\"><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS#css_tutorials\">CSS Tutorials</a></dt>\r\n<dd>\r\n<p>Our&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS\">CSS learning area</a>&nbsp;contains a wealth of tutorials to take you from beginner level to proficiency, covering all the fundamentals.</p>\r\n</dd>\r\n<dt id=\"css_reference\"><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS#css_reference\">CSS Reference</a></dt>\r\n<dd>\r\n<p>Our&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Reference\">exhaustive CSS reference</a>&nbsp;for seasoned Web developers describes every property and concept of CSS.</p>\r\n</dd>\r\n</dl>\r\n<div id=\"sect1\" class=\"callout\">\r\n<h4 id=\"looking_to_become_a_front-end_web_developer\">Looking to become a front-end web developer?</h4>\r\n<p>We have put together a course that includes all the essential information you need to work towards your goal.</p>\r\n<p><a href=\"https://developer.mozilla.org/en-US/docs/Learn/Front-end_web_developer\"><strong>Get started</strong></a></p>\r\n</div>\r\n</div>\r\n</section>\r\n<section>\r\n<h2 id=\"tutorials\"><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS#tutorials\">Tutorials</a></h2>\r\n<div class=\"section-content\">\r\n<p>Our&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS\">CSS Learning Area</a>&nbsp;features multiple modules that teach CSS from the ground up &mdash; no previous knowledge required.</p>\r\n<dl>\r\n<dt id=\"css_first_steps\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS/First_steps\">CSS first steps</a></dt>\r\n<dd>\r\n<p>CSS (Cascading Style Sheets) is used to style and layout web pages &mdash; for example, to alter the font, color, size, and spacing of your content, split it into multiple columns, or add animations and other decorative features. This module provides a gentle beginning to your path towards CSS mastery with the basics of how it works, what the syntax looks like, and how you can start using it to add styling to HTML.</p>\r\n</dd>\r\n<dt id=\"css_building_blocks\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks\">CSS building blocks</a></dt>\r\n<dd>\r\n<p>This module carries on where&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS/First_steps\">CSS first steps</a>&nbsp;left off &mdash; now you\'ve gained familiarity with the language and its syntax, and got some basic experience with using it, it\'s time to dive a bit deeper. This module looks at the cascade and inheritance, all the selector types we have available, units, sizing, styling backgrounds and borders, debugging, and lots more.</p>\r\n<p>The aim here is to provide you with a toolkit for writing competent CSS and help you understand all the essential theory, before moving on to more specific disciplines like&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS/Styling_text\">text styling</a>&nbsp;and&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout\">CSS layout</a>.</p>\r\n</dd>\r\n<dt id=\"css_styling_text\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS/Styling_text\">CSS styling text</a></dt>\r\n<dd>\r\n<p>With the basics of the CSS language covered, the next CSS topic for you to concentrate on is styling text &mdash; one of the most common things you\'ll do with CSS. Here we look at text styling fundamentals, including setting font, boldness, italics, line and letter spacing, drop shadows, and other text features. We round off the module by looking at applying custom fonts to your page, and styling lists and links.</p>\r\n</dd>\r\n<dt id=\"css_layout\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout\">CSS layout</a></dt>\r\n<dd>\r\n<p>At this point we\'ve already looked at CSS fundamentals, how to style text, and how to style and manipulate the boxes that your content sits inside. Now it\'s time to look at how to place your boxes in the right place in relation to the viewport, and to each other. We have covered the necessary prerequisites so we can now dive deep into CSS layout, looking at different display settings, modern layout tools like flexbox, CSS grid, and positioning, and some of the legacy techniques you might still want to know about.</p>\r\n</dd>\r\n<dt id=\"use_css_to_solve_common_problems\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/CSS/Howto\">Use CSS to solve common problems</a></dt>\r\n<dd>\r\n<p>This module provides links to sections of content explaining how to use CSS to solve common problems when creating a web page.</p>\r\n</dd>\r\n</dl>\r\n</div>\r\n</section>\r\n<section>\r\n<h2 id=\"reference\"><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS#reference\">Reference</a></h2>\r\n<div class=\"section-content\">\r\n<ul>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Reference\">CSS reference</a>: This exhaustive reference for seasoned Web developers describes every property and concept of CSS.</li>\r\n<li>CSS key concepts:\r\n<ul>\r\n<li>The&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax\">syntax and forms of the language</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity\">Specificity</a>,&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Inheritance\">inheritance</a>, and&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Cascade\">the Cascade</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Values_and_Units\">CSS units and values</a>&nbsp;and&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Functions\">functional notations</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_box_model/Introduction_to_the_CSS_box_model\">Box model</a>&nbsp;and&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_box_model/Mastering_margin_collapsing\">margin collapse</a></li>\r\n<li>The&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Containing_block\">containing block</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_positioned_layout/Understanding_z-index/Stacking_context\">Stacking</a>&nbsp;and&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Block_formatting_context\">block-formatting</a>&nbsp;contexts</li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/initial_value\">Initial</a>,&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/computed_value\">computed</a>,&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/used_value\">used</a>, and&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/actual_value\">actual</a>&nbsp;values</li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties\">CSS shorthand properties</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_flexible_box_layout\">CSS Flexible Box Layout</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout\">CSS Grid Layout</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_selectors\">CSS selectors</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_media_queries\">Media queries</a></li>\r\n<li><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/animation\">Animation</a></li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</div>\r\n</section>\r\n<section>\r\n<h2 id=\"cookbook\"><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS#cookbook\">Cookbook</a></h2>\r\n<div class=\"section-content\">\r\n<p>The&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/Layout_cookbook\">CSS layout cookbook</a>&nbsp;aims to bring together recipes for common layout patterns, things you might need to implement in your sites. In addition to providing code you can use as a starting point in your projects, these recipes highlight the different ways layout specifications can be used and the choices you can make as a developer.</p>\r\n</div>\r\n</section>\r\n<section>\r\n<h2 id=\"tools_for_css_development\"><a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS#tools_for_css_development\">Tools for CSS development</a></h2>\r\n<div class=\"section-content\">\r\n<ul>\r\n<li>You can use the&nbsp;<a class=\"external\" href=\"https://jigsaw.w3.org/css-validator/\" target=\"_blank\">W3C CSS Validation Service</a>&nbsp;to check if your CSS is valid. This is an invaluable debugging tool.</li>\r\n<li><a class=\"external\" href=\"https://firefox-source-docs.mozilla.org/devtools-user/index.html\" target=\"_blank\">Firefox Developer Tools</a>&nbsp;lets you view and edit a page\'s live CSS via the&nbsp;<a class=\"external\" href=\"https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/index.html\" target=\"_blank\">Inspector</a>&nbsp;and&nbsp;<a class=\"external\" href=\"https://firefox-source-docs.mozilla.org/devtools-user/style_editor/index.html\" target=\"_blank\">Style Editor</a>&nbsp;tools.</li>\r\n<li>The&nbsp;<a class=\"external\" href=\"https://addons.mozilla.org/en-US/firefox/addon/web-developer/\" target=\"_blank\">Web Developer extension</a>&nbsp;for Firefox lets you track and edit live CSS on watched sites.</li>\r\n</ul>\r\n</div>\r\n</section>', 0, 1, 1, '2023-12-28 00:11:03', '2023-12-28 00:26:39'),
(8, 9, 'Why XSL won’t replace CSS?', 'why-xsl-wont-replace-css', 'why-xsl-wont-replace-css-2023-12-27-658c4dbdf26e3.jfif', '<h3>Why XSL won&rsquo;t replace CSS?</h3>\r\n<p><br /><br />- XSL is used for complex formatting on the content that can be displayed on multiple places.<br /><br />- XSL is not for the dynamic formatting that uses the content in the online document using the multiple files.<br /><br />- XSL provides lots of capabilities but with limits as it provides efficient and easy to allow modifications.<br /><br />- It provides content generation workflows and uses different tools to choose the tasks and XSL files.<br /><br />- XSL is used to serve the web page to customize the XML data into the XML document and use the CSS for styling purpose.</p>', 0, 1, 1, '2023-12-28 00:15:58', '2023-12-28 00:25:56'),
(9, 9, 'What is Difference Between HTML and XHTML?', 'what-is-difference-between-html-and-xhtml', 'what-is-difference-between-html-and-xhtml-2023-12-27-658c4ea65a934.png', '<section class=\"main\">\r\n<p>HTML is a markup language that was used to build the world\'s first webpage. Ever since this webpage was created, there have been a lot of modifications and variations done in the HTML language, such as adding the concept of error handling, addition of new features such as a table, etc., because of which XHTML came into the picture.</p>\r\n<p>Both languages are used to build web and Android applications. However both languages are the two sides of the same coin, but there are some major differences between the two.</p>\r\n<p>HTML stands for Hypertext Markup Language, whereas XHTML stands for Extensible Hypertext Markup Language. It is an extension of HTML and is stricter and more structured compared to HTML.</p>\r\n<p>In this article, we will be pointing out some major differences between the two of them.</p>\r\n</section>\r\n<section class=\"main\">\r\n<h2 id=\"html-vs--xhtml\">HTML vs. XHTML</h2>\r\n<div>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>HTML</th>\r\n<th>XHTML</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>1. HTML is an SGML-based language. That is, it defines the standard for generalizing the markup languages for documents. SGML stands for Standard Generalized Markup Language.</td>\r\n<td>1. XHTML is an XML-based language, which means it manipulates and processes data using XML technologies.</td>\r\n</tr>\r\n<tr>\r\n<td>2. HTML is not a case-sensitive language.</td>\r\n<td>2. XHTML is a case-sensitive language.</td>\r\n</tr>\r\n<tr>\r\n<td>3. HTML empty elements do not require a closing tag at the end, not even a \"/\" symbol to signify the end of the tag.</td>\r\n<td>3. XHTML empty elements must always be closed; that is, there must be a \"/\" symbol at the end of the empty element.</td>\r\n</tr>\r\n<tr>\r\n<td>5. The tags and attributes in HTML can be specified either in lowercase or uppercase since it is not case-sensitive.</td>\r\n<td>5. All XHTML elements and attributes must be in lowercase since it is a case-sensitive language.</td>\r\n</tr>\r\n<tr>\r\n<td>6. The HTML document requires a minimum of four tags to create an HTML page that is &lt;html&gt;, &lt;head&gt;, &lt;title&gt;, and &lt;body&gt;. The &lt;!DOCTYPE&gt; declaration is not necessary for HTML.</td>\r\n<td>6. An XHTML document must contain the &lt;!DOCTYPE&gt; declaration followed by the &lt;html&gt;, &lt;head&gt;, &lt;title&gt;, and &lt;body&gt; tags in its document to create a webpage. Moreover, the xmlns attribute in &lt;html&gt; tag is also necessary.</td>\r\n</tr>\r\n<tr>\r\n<td>7. Some HTML elements may function properly without a closing tag.</td>\r\n<td>7. All the XHTML elements must be closed. Even the empty elements also require a closing tag.</td>\r\n</tr>\r\n<tr>\r\n<td>8. Some elements in HTML may be improperly nested; that is, they do not need to be closed in the order in which they are opened.</td>\r\n<td>8. All XHTML elements, however, must be properly nested within each other; that is, they must be closed in the order in which they were opened.</td>\r\n</tr>\r\n<tr>\r\n<td>9. It is not mandatory to put quotes while using the attributes in HTML.</td>\r\n<td>9. It is mandatory to put quotes around an attribute in XHTML.</td>\r\n</tr>\r\n<tr>\r\n<td>10. It allows attribute minimization, where boolean attributes can omit their values. For example, \"checked\".</td>\r\n<td>10. It does not allow attribute minimization. All the attributes must be written in full attribute-value pairs.</td>\r\n</tr>\r\n<tr>\r\n<td>11. The webpage is displayed even if the HTML document has some errors in it.</td>\r\n<td>11. There is a more strict error handling in XHTML.</td>\r\n</tr>\r\n<tr>\r\n<td>12. It can have a filename extension of.html or.htm.</td>\r\n<td>12. Its filename extension can be .xhtml,.xht, or .xml.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</section>\r\n<section class=\"main\">\r\n<h2 id=\"examples\">Examples</h2>\r\n<p>There are a lot of differences specified above in the table that we are going to look at here in detail with the help of examples.</p>\r\n<h3 id=\"an-xhtml-document-with-a-minimum-of-required-tags\">An XHTML Document with a Minimum of Required Tags</h3>\r\n<p>The XHTML document requires some tags that must be present in the document, without which the web or Android application cannot be created.</p>\r\n<p>Firstly, the &lt;!DOCTYPE&gt; declaration must be present in an XHTML document. Furthermore, the &lt;html&gt;, &lt;head&gt;, &lt;title&gt;, and &lt;body&gt; tags must be specified in the document.</p>\r\n<p>Moreover, it also requires the xmlns attribute in &lt;html&gt; to specify the XML namespace for the document.</p>\r\n<p>Let us see it with an example-</p>\r\n<div class=\"code-box_snippetContainer__cJ6zK\">\r\n<pre><code class=\"language-XHTML\">&lt;!DOCTYPE <span class=\"hljs-meta-keyword\">html</span> <span class=\"hljs-meta-keyword\">PUBLIC</span> \"-//W3C//DTD XHTML 1.1//EN\"\r\n\"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\"&gt;\r\n<span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">html</span> <span class=\"hljs-tag\">xmlns</span><span class=\"hljs-tag\">=</span><span class=\"hljs-tag\">\"http://www.w3.org/1999/xhtml\"</span><span class=\"hljs-tag\">&gt;</span>\r\n<span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">head</span><span class=\"hljs-tag\">&gt;</span>\r\n  <span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">title</span><span class=\"hljs-tag\">&gt;</span>First Webpage<span class=\"hljs-tag\">&lt;/</span><span class=\"hljs-tag\">title</span><span class=\"hljs-tag\">&gt;</span>\r\n<span class=\"hljs-tag\">&lt;/</span><span class=\"hljs-tag\">head</span><span class=\"hljs-tag\">&gt;</span>\r\n<span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">body</span><span class=\"hljs-tag\">&gt;</span>\r\n\r\n The body of the page goes here...\r\n\r\n<span class=\"hljs-tag\">&lt;/</span><span class=\"hljs-tag\">body</span><span class=\"hljs-tag\">&gt;</span>\r\n<span class=\"hljs-tag\">&lt;/</span><span class=\"hljs-tag\">html</span><span class=\"hljs-tag\">&gt;</span>\r\n</code></pre>\r\n<div id=\"copy\" class=\"__react_component_tooltip tdc89aeeb-6136-476a-8425-96319f324410 place-top type-dark\" data-id=\"tooltip\">&nbsp;</div>\r\n</div>\r\n<p>The first two lines of the example are the DTD (Document Type Definition), which tells the browser which type of markup language the web page is using. However, it is always written at the start of an XHTML document.</p>\r\n<p>After which, the &lt;html&gt; tag is defined. Everything that is inside an HTML or XHTML document must be enclosed within the &lt;html&gt; tag.</p>\r\n<p>Further, the &lt;head&gt;, &lt;title&gt;, and &lt;body&gt; tags are defined, which specify the rest of the content of the webpage.</p>\r\n<h3 id=\"xhtml-elements-must-be-properly-nested\">XHTML Elements Must be Properly Nested</h3>\r\n<p>All the XHTML elements must be properly nested. That is, they should be closed in the same order in which they were opened.</p>\r\n<p>Let us see it with an example.</p>\r\n<p><strong>Wrong:</strong></p>\r\n<div class=\"code-box_snippetContainer__cJ6zK\">\r\n<pre><code class=\"language-XHTML\"><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">b</span><span class=\"hljs-tag\">&gt;</span><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">i</span><span class=\"hljs-tag\">&gt;</span>Hello! You are welcome here. <span class=\"hljs-tag\">&lt;/</span><span class=\"hljs-tag\">b</span><span class=\"hljs-tag\">&gt;</span><span class=\"hljs-tag\">&lt;/</span><span class=\"hljs-tag\">i</span><span class=\"hljs-tag\">&gt;</span>\r\n</code></pre>\r\n<div id=\"copy\" class=\"__react_component_tooltip tc16ce189-42f1-4fa1-9241-4936d9df1885 place-top type-dark\" data-id=\"tooltip\">&nbsp;</div>\r\n</div>\r\n<p>The above code snippet is wrong because the &lt;b&gt; and &lt;i&gt; tags used above are not properly nested. The &lt;i&gt; tag is used as a child of the &lt;b&gt; tag since it is opened after it. Therefore, it must be closed inside the &lt;b&gt; only.</p>\r\n<p>However, the correct way to represent them is as follows-</p>\r\n<p><strong>Correct:</strong></p>\r\n<pre><span class=\"highlight--red\">&lt;b&gt;&lt;i&gt; Hello! You are welcome here. &lt;/i&gt;&lt;/b&gt;\r\n</span></pre>\r\n<h3 id=\"xhtml-elements-must-always-be-closed\">XHTML Elements Must Always be Closed</h3>\r\n<p>The elements in XHTML must always be closed.</p>\r\n<p>Let us see it with an example.</p>\r\n<p><strong>Wrong:</strong></p>\r\n<div class=\"code-box_snippetContainer__cJ6zK\">\r\n<pre><code class=\"language-XHTML\">&lt;h1&gt; Hello there! How are you? \r\n&lt;h2&gt; I am good. What about you? \r\n</code></pre>\r\n<div id=\"copy\" class=\"__react_component_tooltip t13b84e6f-00a0-4561-9ae8-3596a17212c2 place-top type-dark\" data-id=\"tooltip\">&nbsp;</div>\r\n</div>\r\n<p>The above code snippet is wrong because the &lt;h1&gt; and &lt;h2&gt; tags are opened but not closed. They must always be closed.</p>\r\n<p>However, the correct way to represent them is as follows-</p>\r\n<p><strong>Correct:</strong></p>\r\n<div class=\"code-box_snippetContainer__cJ6zK\">\r\n<pre><code class=\"language-XHTML\">&lt;h1&gt; Hello there! How are you? &lt;/h1&gt;\r\n&lt;h2&gt; I am good. What about you? &lt;/h2&gt;\r\n</code></pre>\r\n<div id=\"copy\" class=\"__react_component_tooltip t59b18b3c-0bc5-4331-b929-832be7ed3fc2 place-top type-dark\" data-id=\"tooltip\">&nbsp;</div>\r\n</div>\r\n<h3 id=\"empty-elements-in-xhtml-must-always-be-closed\">Empty Elements in XHTML Must Always Be Closed</h3>\r\n<p>Empty elements are those that do not contain anything between them. Therefore, these tags do not contain a closing tag, but they must be closed with the symbol &lsquo;/&rsquo; at the end of the tag.</p>\r\n<p>These tags are used to perform some action on the webpage, such as including a horizontal line, adding an image, etc.</p>\r\n<p>Let us see them with an example.</p>\r\n<p><strong>Wrong:</strong></p>\r\n<div class=\"code-box_snippetContainer__cJ6zK\">\r\n<pre><code class=\"language-XHTML\"><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">img</span> <span class=\"hljs-tag\">src</span><span class=\"hljs-tag\">=</span><span class=\"hljs-tag\">\"google.jpg\"</span> <span class=\"hljs-tag\">alt</span><span class=\"hljs-tag\">=</span><span class=\"hljs-tag\">\"google\"</span><span class=\"hljs-tag\"> &gt;</span>\r\nWe welcome you!\r\n<span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">hr</span><span class=\"hljs-tag\">&gt;</span>\r\n</code></pre>\r\n<div id=\"copy\" class=\"__react_component_tooltip tafa781b1-9760-4768-b48c-64019dec4192 place-top type-dark\" data-id=\"tooltip\">&nbsp;</div>\r\n</div>\r\n<p>The above code snippet is wrong because the empty tags &lt;hr&gt; and &lt;img&gt; used above are not closed. Empty tags are self-closing tags and must be closed with a \'/\' symbol.</p>\r\n<p>However, the correct way to represent them is as follows-</p>\r\n<p><strong>Correct:</strong></p>\r\n<div class=\"code-box_snippetContainer__cJ6zK\">\r\n<pre><code class=\"language-XHTML\"><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">img</span> <span class=\"hljs-tag\">src</span><span class=\"hljs-tag\">=</span><span class=\"hljs-tag\">\"google.jpg\"</span> <span class=\"hljs-tag\">alt</span><span class=\"hljs-tag\">=</span><span class=\"hljs-tag\">\"google\"</span><span class=\"hljs-tag\"> /&gt;</span>\r\nWe welcome you!\r\n<span class=\"hljs-tag\">&lt;</span><span class=\"hljs-tag\">hr</span><span class=\"hljs-tag\">/&gt;</span>\r\n\r\n</code></pre>\r\n<div id=\"copy\" class=\"__react_component_tooltip t3fcf6718-2ede-423e-b75d-fd58a8260f41 place-top type-dark\" data-id=\"tooltip\">&nbsp;</div>\r\n</div>\r\n<h3 id=\"xhtml-attribute-names-must-be-in-lowercase\">XHTML Attribute Names Must be in Lowercase</h3>\r\n<p>XHTML elements and attribute names must be in lowercase as it is a case-sensitive language and treats upper and lowercase letters differently.</p>\r\n</section>', 0, 1, 1, '2023-12-28 00:19:50', '2023-12-28 00:26:18'),
(10, 3, 'What is Core Java', 'what-is-core-java', 'what-is-core-java-2023-12-28-658ce2c4e835a.jfif', '<p>The word&nbsp;<strong><em>Core</em></strong>&nbsp;describes the basic concept of something, and here, the phrase&nbsp;<em>\'Core Java\'</em>&nbsp;defines the basic Java that covers the basic concept of Java programming language. We all are aware that Java is one of the well-known and widely used programming languages, and to begin with it, the beginner has to start the journey with Core Java and then towards the&nbsp;<a href=\"https://www.javatpoint.com/what-is-advance-java\">Advance Java</a>. The&nbsp;<a href=\"https://www.javatpoint.com/java-tutorial\">Java programming language</a>&nbsp;is a general-purpose programming language that is based on the OOPs concept. The ocean of Java is too deep to learn, i.e., as much you learn more, you will know its depth. Java is a platform-independent and robust programming language. The principle followed by Java is&nbsp;<strong>WORA</strong>&nbsp;that says&nbsp;<em>Write Once, Run Anywhere</em>. The programming language is quite simple and easy to understand. But one should know that Core Java is not different from Java. Java is complete in itself, but for the beginners, it is natural that the beginner must begin with the core concepts of Java. In actual, Java has different editions, where Core Java is one of the parts of an edition.</p>\r\n<h2 class=\"h2\">Java Editions</h2>\r\n<p><strong>The Java Programming Language has the following defined editions that it supports:</strong></p>\r\n<h3 class=\"h3\">Java SE (Java Standard Edition)</h3>\r\n<p>he&nbsp;<a href=\"https://www.javatpoint.com/java-se\">Java SE</a>&nbsp;is a computing-based platform and used for developing desktop or Window based applications. Thus, core Java is the part of Java SE where the developers develop desktop-based applications by using the basic concepts of Java where&nbsp;<a href=\"https://www.javatpoint.com/difference-between-jdk-jre-and-jvm#jdk\">JDK (Java Development Kit)</a>&nbsp;is a quite familiar Java SE implementation.</p>\r\n<h3 class=\"h3\">Java EE (Java Enterprise Edition)</h3>\r\n<h3 class=\"h3\">Java ME (Java Micro Edition)</h3>\r\n<p>It is the micro edition that is used for the development of mobile phone applications. Thus, for the development of mobile applications, one needs to use&nbsp;<a href=\"https://www.javatpoint.com/java-me\">Java ME</a>.</p>\r\n<p>Thus, it is clear that Core Java is the part of Java SE and Java SE is the foundation for all other Java editions.</p>\r\n<h2 class=\"h2\">Concepts Covered in Core Java</h2>\r\n<p><strong>The following concepts are some of the major basic concepts of Java through which a beginner should go through:</strong></p>\r\n<div id=\"08cbfb7a-e125-4873-a4b3-43e8b6ffe417\" class=\"_ap_apex_ad\" style=\"color: #333333; font-family: inter-regular, system-ui, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: block; clear: both; text-align: center; margin: 10px auto 30px; width: 728px; height: 280px; overflow: hidden;\" data-section=\"08cbfb7a-e125-4873-a4b3-43e8b6ffe417\" data-xpath=\"#city &gt; table:eq(0) &gt; tbody:eq(0) &gt; tr:eq(0) &gt; td:eq(0) &gt; ul:eq(0)\" data-section-id=\"\" data-ap-network=\"custom\">&nbsp;</div>\r\n<ul class=\"points\">\r\n<li>Java Fundamentals</li>\r\n<li><a href=\"https://www.javatpoint.com/java-oops-concepts\">OOPs Concepts</a></li>\r\n<li><a href=\"https://www.javatpoint.com/method-overloading-in-java\">Overloading</a>&nbsp;&amp;&nbsp;<a href=\"https://www.javatpoint.com/method-overriding-in-java\">Overriding</a></li>\r\n<li><a href=\"https://www.javatpoint.com/inheritance-in-java\">Inheritance</a>&nbsp;with&nbsp;<a href=\"https://www.javatpoint.com/interface-in-java\">Interface</a>&nbsp;and&nbsp;<a href=\"https://www.javatpoint.com/abstract-class-in-java\">Abstract Class</a></li>\r\n<li><a href=\"https://www.javatpoint.com/exception-handling-in-java\">Exception Handling</a></li>\r\n<li><a href=\"https://www.javatpoint.com/package\">Packages</a></li>\r\n<li><a href=\"https://www.javatpoint.com/collections-in-java\">Collections</a></li>\r\n<li><a href=\"https://www.javatpoint.com/multithreading-in-java\">Multithreading</a></li>\r\n<li><a href=\"https://www.javatpoint.com/java-swing\">Swings</a></li>\r\n<li><a href=\"https://www.javatpoint.com/java-applet\">Applets</a></li>\r\n<li><a href=\"https://www.javatpoint.com/java-jdbc\">JDBC</a>&nbsp;(Basic Database Connections)</li>\r\n</ul>\r\n<p>Although these major concepts hold its own depth, after gaining and implementing the best knowledge in the basic Java concepts, one can move towards the advanced Java version as the advanced section of the Java is quite interesting but can only be understood when the core concepts of Java are clear.</p>\r\n<h2 class=\"h2\">Core Java Vs. Advance Java</h2>\r\n<p>Both Core Java and Advance Java are parts of Java programming, but for understanding the entire Java better, we need to differentiate between both. So, below we have described some differences between both core java and advance Java:</p>', 0, 1, 1, '2023-12-28 10:51:49', '2023-12-28 10:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(2, 2, 4, NULL, NULL),
(3, 3, 8, NULL, NULL),
(4, 4, 5, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 10, NULL, NULL),
(7, 7, 9, NULL, NULL),
(8, 8, 8, NULL, NULL),
(9, 8, 9, NULL, NULL),
(10, 9, 7, NULL, NULL),
(11, 9, 10, NULL, NULL),
(12, 10, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribes`
--

INSERT INTO `subscribes` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'habib@gmail.com', '2023-12-27 00:50:40', '2023-12-27 00:50:40');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'php', '2023-12-20 02:43:50', '2023-12-20 02:43:50'),
(2, 'JAVA', 'java', '2023-12-27 00:32:49', '2023-12-27 00:32:49'),
(3, 'jQuery', 'jquery', '2023-12-27 00:33:10', '2023-12-27 00:33:10'),
(4, 'react js', 'react-js', '2023-12-27 00:33:35', '2023-12-27 00:33:35'),
(5, 'node js', 'node-js', '2023-12-27 00:33:50', '2023-12-27 00:33:50'),
(6, 'Dot Net', 'dot-net', '2023-12-27 00:34:07', '2023-12-27 00:34:07'),
(7, 'XHTML', 'xhtml', '2023-12-27 00:34:42', '2023-12-27 00:34:42'),
(8, 'XSL', 'xsl', '2023-12-27 00:35:06', '2023-12-27 00:35:06'),
(9, 'CSS', 'css', '2023-12-27 23:46:21', '2023-12-27 23:46:21'),
(10, 'HTML', 'html', '2023-12-27 23:46:31', '2023-12-27 23:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL DEFAULT 'default.png',
  `about` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `email_verified_at`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Md.Admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$91kGlPK02.ikrUigNacjrueRkriASqlJStPj.1tiIEJqQPlEXD4ua', 'mdadmin-2023-12-26-658af9c5c35bb.jpg', NULL, NULL, '2023-12-20 02:28:37', '2023-12-27 00:05:26'),
(3, 2, 'Sumon Rana', 'sumonrana', 'sumonrana@gmail.com', NULL, '$2y$10$F3sS7yRVAOTvQ8EVjhws9eZfsQi3g6jXhbJXhJXQ0Ojx1qHCecB4a', 'sumon-rana-2023-12-26-658af53111c1b.jpg', NULL, NULL, '2023-12-26 23:38:15', '2023-12-26 23:45:53'),
(6, 2, 'habib', 'habib', 'habib@gmail.com', NULL, '$2y$10$1ILXAnHb.nQaXMZh9iv.g.42vqK8K3g/Iju3lqLiopY8LMJlEXjVi', 'habib-2023-12-26-658b055c37cfe.jpg', NULL, NULL, '2023-12-27 00:54:22', '2023-12-27 00:54:52'),
(7, 2, 'riaz', 'riaz sheikh', 'riazsheikh@gmail.com', NULL, '$2y$10$Rcfr78vuGiR6dVtkPShcOuKUSXJfIiz8nA3uMl48GMCCen1z2GV/6', 'default.png', NULL, NULL, '2023-12-27 15:33:05', '2023-12-27 15:33:05'),
(8, 2, 'rakib', 'rakib hossain', 'rakib@gmail.com', NULL, '$2y$10$nfANhWnJaiAuVxz3IGEhluj7cMjXLj5NI./veHwWTf.nrzgf3yqt.', 'rakib-2023-12-27-658c474d4d572.webp', NULL, NULL, '2023-12-27 23:40:54', '2023-12-27 23:48:29'),
(9, 2, 'hazrat', 'Hazrat Ali', 'hazrat@gmail.com', NULL, '$2y$10$qw8hdWZ6xbs9uuaU..1/KOP5PdCVVqWZf1fNcedNLWkeFUJD3ubL6', 'hazrat-2023-12-27-658c495eddf49.jfif', NULL, NULL, '2023-12-27 23:56:34', '2023-12-27 23:57:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user_post_id_foreign` (`post_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `post_user`
--
ALTER TABLE `post_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
