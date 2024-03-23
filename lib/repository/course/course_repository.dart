import '../../model/course_model.dart';

class CourseRepository {
  final List<CourseModel> _courses = const [
    CourseModel(
      id: "65f596c5c1f88277ff3756b3",
      title: "Landscaping Photography Masterclass",
      description: "Learn the art of capturing stunning landscapes.",
      category: CourseCategory.business,
      price: 60,
      oldPrice: 90,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0b2",
          title: "Getting Started",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0b6",
              title: "Introduction to Landscaping Photography",
              url: "www.introvideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0bb",
              title: "Choosing the Right Equipment",
              url: "www.equipmentvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756b4",
      title: "Portrait Photography Essentials",
      description: "Master the techniques for capturing compelling portraits.",
      category: CourseCategory.design,
      price: 55,
      oldPrice: 80,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0b3",
          title: "Understanding Light and Composition",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0b7",
              title: "Lighting Techniques for Portraits",
              url: "www.lightingvideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0bc",
              title: "Composition Rules for Portraits",
              url: "www.compositionvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756b5",
      title: "Digital Marketing Fundamentals",
      description: "Learn the basics of digital marketing strategies and tools.",
      category: CourseCategory.itAndSoftware,
      price: 50,
      oldPrice: 70,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0b4",
          title: "Social Media Marketing",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0b8",
              title: "Effective Strategies for Social Media Engagement",
              url: "www.socialmediavideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0bd",
              title: "Advertising Techniques on Social Platforms",
              url: "www.advertisingvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756b6",
      title: "Introduction to Web Development",
      description: "Explore the foundational concepts of web development.",
      category: CourseCategory.marketing,
      price: 65,
      oldPrice: 100,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0b5",
          title: "HTML and CSS Basics",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0b9",
              title: "Introduction to HTML",
              url: "www.htmlvideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0be",
              title: "Styling with CSS",
              url: "www.cssvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756b7",
      title: "Yoga and Meditation for Beginners",
      description: "Discover the benefits of yoga and meditation for holistic well-being.",
      category: CourseCategory.photographyAndVideo,
      price: 40,
      oldPrice: 60,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0b6",
          title: "Introduction to Yoga",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0ba",
              title: "Basic Yoga Poses",
              url: "www.yogavideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0bf",
              title: "Benefits of Meditation",
              url: "www.meditationvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756b8",
      title: "Cooking Essentials",
      description: "Learn fundamental cooking techniques and recipes.",
      category: CourseCategory.business,
      price: 45,
      oldPrice: 75,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0b7",
          title: "Knife Skills and Basic Techniques",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0bb",
              title: "Knife Handling and Safety",
              url: "www.knifevideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0c0",
              title: "Basic Cooking Methods",
              url: "www.cookingvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756b9",
      title: "Graphic Design Mastery",
      description: "Master the principles and tools of graphic design.",
      category: CourseCategory.design,
      price: 75,
      oldPrice: 110,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0b8",
          title: "Adobe Photoshop Essentials",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0bc",
              title: "Introduction to Photoshop Interface",
              url: "www.photoshopvideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0c1",
              title: "Basic Photo Editing Techniques",
              url: "www.editingvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756ba",
      title: "Financial Planning for Beginners",
      description: "Learn the basics of personal finance and investment strategies.",
      category: CourseCategory.itAndSoftware,
      price: 55,
      oldPrice: 85,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0b9",
          title: "Budgeting and Saving",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0bd",
              title: "Creating a Personal Budget",
              url: "www.budgetingvideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0c2",
              title: "Saving and Investment Strategies",
              url: "www.investmentvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756bb",
      title: "Introduction to Artificial Intelligence",
      description: "Explore the fundamentals of AI and machine learning.",
      category: CourseCategory.marketing,
      price: 70,
      oldPrice: 100,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0ba",
          title: "Basic Concepts of AI",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0be",
              title: "Introduction to Machine Learning",
              url: "www.machinelearningvideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0c3",
              title: "Applications of AI in Real World",
              url: "www.aiapplicationsvideo.com",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: "65f596c5c1f88277ff3756bc",
      title: "Creative Writing Workshop",
      description: "Unlock your creativity and refine your writing skills.",
      category: CourseCategory.photographyAndVideo,
      price: 60,
      oldPrice: 95,
      sections: [
        SectionModel(
          id: "65f5b5fb241999060694b0bb",
          title: "Crafting Compelling Narratives",
          videos: [
            VideoModel(
              id: "65f5b614241999060694b0bf",
              title: "Building Engaging Characters",
              url: "www.characterbuildingvideo.com",
            ),
            VideoModel(
              id: "65f5b61c241999060694b0c4",
              title: "Structuring Effective Storylines",
              url: "www.storylinevideo.com",
            ),
          ],
        ),
      ],
    ),
  ];

  List<CourseModel> get courses => _courses;


}
