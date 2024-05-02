<template>
  <div class="py-4 container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-12">
            <card
              :title="stats.money.title"
              :value="stats.money.value"
              :iconClass="stats.money.iconClass"
              :iconBackground="stats.money.iconBackground"
              directionReverse
            ></card>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <card
              :title="stats.users.title"
              :value="stats.users.value"
              :iconClass="stats.users.iconClass"
              :iconBackground="stats.users.iconBackground"
              directionReverse
            ></card>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <card
              :title="stats.clients.title"
              :value="stats.clients.value"
              :iconClass="stats.clients.iconClass"
              :iconBackground="stats.clients.iconBackground"
              :percentageColor="stats.clients.percentageColor"
              directionReverse
            ></card>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <card
              :title="stats.sales.title"
              :value="stats.sales.value"
              :iconClass="stats.sales.iconClass"
              :iconBackground="stats.sales.iconBackground"
              directionReverse
            ></card>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-7 mb-lg">
            <!-- line chart -->
            <div class="card z-index-2">
              <gradient-line-chart />
            </div>
          </div>
          <div class="col-lg-5">
            <carousel />
          </div>
        </div>
        <!-- <div class="row mt-4">
          <div class="col-lg-5">
            <categories-card />
          </div>
        </div> -->
      </div>
    </div>
  </div>
</template>
<script>
import Card from "@/examples/Cards/Card.vue";
import GradientLineChart from "@/examples/Charts/GradientLineChart.vue";
import Carousel from "./components/Carousel.vue";
// import CategoriesCard from "./components/CategoriesCard.vue";

export default {
  name: "dashboard-default",
  data() {
    return {
      stats: {
        money: {
          title: "Today's Money",
          value: "$53,000",
          iconClass: "ni ni-money-coins",
          iconBackground: "bg-gradient-primary",
        },
        users: {
          title: "Pengguna",
          value: "2,300",
          iconClass: "ni ni-world",
          iconBackground: "bg-gradient-danger",
        },
        clients: {
          title: "Template",
          value: "+3,462",
          iconClass: "ni ni-paper-diploma",
          percentageColor: "text-danger",
          iconBackground: "bg-gradient-success",
        },
        sales: {
          title: "Sales",
          value: "$103,430",
          iconClass: "ni ni-cart",
          iconBackground: "bg-gradient-warning",
        },
      },
    };
  },
  components: {
    Card,
    GradientLineChart,
    Carousel,
    // CategoriesCard,
  },
};
</script>
